local root_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.g['test#javascript#jest#executable'] = 'docker-compose exec -T ' .. root_dir .. ' ./node_modules/.bin/jest --colors'

vim.cmd([[
function! DebugJestTransform(cmd) abort
  let root_dir = fnamemodify(getcwd(), ":t")
  let debug_cmd = 'docker-compose exec -T -e NODE_OPTIONS="--inspect-brk=0.0.0.0:9229" ' . root_dir . ' ./node_modules/.bin/jest --colors'
  return debug_cmd
endfunction

function! WatchJestTransform(cmd) abort
  let root_dir = fnamemodify(getcwd(), ":t")
  let watch_cmd = 'docker-compose exec -T ' . root_dir . ' ./node_modules/.bin/jest --watchAll --colors'
  return watch_cmd
endfunction

let g:test#custom_transformations = {
  \ 'debug': function('DebugJestTransform'),
  \ 'watch': function('WatchJestTransform')
\ }
]])

local dap = require('dap')

function _G.run_test_and_continue_dap(test_cmd)
  local original_transformation = vim.g['test#transformation']
  vim.g['test#transformation'] = 'debug'
  vim.cmd(test_cmd)
  vim.schedule(function()
    dap.continue()
    vim.g['test#transformation'] = original_transformation
  end)
end

function _G.run_test_and_watch(test_cmd)
  local original_transformation = vim.g['test#transformation']
  local original_strategy = vim.g['test#strategy']
  vim.g['test#transformation'] = 'watch'
  vim.g['test#strategy'] = 'tmux_window'
  vim.cmd(test_cmd)
  vim.g['test#transformation'] = original_transformation
  vim.g['test#strategy'] = original_strategy
end

vim.cmd([[
function! TmuxWindowStrategy(cmd) abort
  let l:original_type = get(g:, 'VimuxOrientation', '')

  let g:VimuxRunnerType = "window"
  let g:VimuxRunnerName = "vim-test"

  call VimuxRunCommand(a:cmd)

  let g:VimuxRunnerType = l:original_type
endfunction

function! TmuxWindowFocusStrategy(cmd) abort
  let l:original_type = get(g:, 'VimuxOrientation', '')

  let g:VimuxRunnerType = "window"
  let g:VimuxRunnerName = "vim-test"

  call VimuxRunCommand(a:cmd)
  call system('tmux select-window -t vim-test')

  let g:VimuxRunnerType = l:original_type
endfunction

let g:test#custom_strategies = {'tmux_window': function('TmuxWindowStrategy'), 'tmux_window_focus': function('TmuxWindowFocusStrategy')}
]])

vim.cmd([[
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"
]])

vim.cmd([[
  let test#strategy = {
    \ 'nearest':   'vimux',
    \ 'last':   'vimux',
    \ 'visit':   'vimux',
    \ 'suite':   'tmux_window_focus',
    \ 'file':   'tmux_window_focus',
  \}
]])

