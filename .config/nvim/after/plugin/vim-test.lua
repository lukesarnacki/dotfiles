-- Set the Jest executable to run inside the Docker Compose environment
vim.g['test#javascript#jest#executable'] = 'docker-compose exec -T store-bridge ./node_modules/.bin/jest --colors'

vim.cmd([[
function! DebugJestTransform(cmd) abort
  let debug_cmd = 'docker-compose exec -T -e NODE_OPTIONS="--inspect-brk=0.0.0.0:9229" store-bridge ./node_modules/.bin/jest --colors'
  let test_cmd = substitute(a:cmd, 'docker-compose exec -T store-bridge ./node_modules/.bin/jest', debug_cmd, '')
  return test_cmd
endfunction

function! WatchJestTransform(cmd) abort
  let watch_cmd = 'docker-compose exec -T store-bridge ./node_modules/.bin/jest --watchAll --colors'
  let test_cmd = substitute(a:cmd, 'docker-compose exec -T store-bridge ./node_modules/.bin/jest', watch_cmd, '')
  return test_cmd
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
  vim.g['test#transformation'] = 'watch'
  vim.cmd(test_cmd)
  vim.g['test#transformation'] = original_transformation
end

vim.cmd([[
function! TmuxWindowStrategy(cmd) abort
  let tmux_new_window_command = 'tmux new-window -d -n vim-test "bash"'
  let tmux_send_keys_command = 'tmux send-keys -t vim-test ' . shellescape(a:cmd . '; bash') . ' Enter'
  let tmux_switch_window_command = 'tmux select-window -t vim-test'
  call system(tmux_new_window_command)
  call system(tmux_send_keys_command)
  call system(tmux_switch_window_command)
endfunction

let g:test#custom_strategies = {'tmux_window': function('TmuxWindowStrategy')}
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
    \ 'suite':   'tmux_window',
    \ 'file':   'tmux_window',
  \}
]])
