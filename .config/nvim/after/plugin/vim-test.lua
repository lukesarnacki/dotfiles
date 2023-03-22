-- Set the Jest executable to run inside the Docker Compose environment
vim.g['test#javascript#jest#executable'] = 'docker-compose exec -T store-bridge ./node_modules/.bin/jest --colors'
-- vim.cmd([[
--   let test#strategy = {
--     \ 'suite':   'kitty',
--   \}
-- ]])

vim.cmd([[
function! DebugJestTransform(cmd) abort
  let debug_cmd = 'docker-compose exec -T -e NODE_OPTIONS="--inspect-brk=0.0.0.0:9229" store-bridge ./node_modules/.bin/jest --colors'
  let test_cmd = substitute(a:cmd, 'docker-compose exec -T store-bridge ./node_modules/.bin/jest', debug_cmd, '')
  return test_cmd
endfunction
]])

vim.cmd("let g:test#custom_transformations = {'debug': function('DebugJestTransform')}")

local dap = require('dap')

function _G.run_test_and_continue_dap(test_cmd)
  vim.cmd("let g:test#transformation = 'debug'")
  vim.cmd(test_cmd)
  vim.schedule(function()
    dap.continue()
  end)
end

vim.cmd("let test#strategy='vimux'")
