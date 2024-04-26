vim.cmd.iabbrev({
  "ymail",
  "cschult@devmem.de",
})

vim.cmd.iabbrev({
  "yname",
  "Christian Schult",
})

vim.cmd.iabbrev({
  "yauthor",
  "author: Christian Schult <cschult@devmem.de>",
})

vim.cmd('iab ydate <c-r>=strftime("%y-%m-%d")<cr>')
vim.cmd('iab ydatum <c-r>=strftime("%x")<cr>')
-- iab ydat <c-r>=strftime("%d.%m.%y")<cr>
vim.cmd('iab ystamp last changed: <c-r>=strftime("%x %X")<cr>')
-- insert the current filename *with* path:
vim.cmd('iab ypfile <c-r>=expand("%:p")<cr>')
-- insert the current filename *without* path:
vim.cmd('iab yfile <c-r>=expand("%:t")<cr>')
