-- Set the Jest executable to run inside the Docker Compose environment
vim.g['test#javascript#jest#executable'] = 'docker-compose exec -T store-bridge ./node_modules/.bin/jest --colors'
vim.cmd([[
  let test#strategy = {
    \ 'suite':   'kitty',
  \}
]])
