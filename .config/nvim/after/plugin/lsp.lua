local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
-- lsp.configure('sumneko_lua', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
-- cmp_mappings['<CR>'] = nil
--
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.configure('tsserver', {
  settings = {
    completions = {
      completeFunctionCalls = true,
      documentFormatting = false
    }
  }
})

lsp.setup()


local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup('null_format', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      desc = 'Fix and format',
      callback = function()
        vim.cmd('EslintFixAll')
        vim.lsp.buf.format({ id = client.id })
      end
    })
  end,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
    })
  }
})

vim.diagnostic.config({
  virtual_text = true,
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- LSP Diagnostics Options Setup

vim.cmd([[
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ge <cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>
]])

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end
sign({ name = 'DiagnosticSignError', text = '󰆣' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    border = 'single',
    source = 'always',
    header = '',
    prefix = '- ',
  },
})
-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.o.updatetime = 350

-- vim.cmd([[
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])
