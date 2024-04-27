local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map('i', '<A-j>', '<esc>:m .+1<cr>==gi', { desc = 'line move down' })
-- map('i', '<A-k>', '<esc>:m .-2<cr>==gi', { desc = 'line move up' })
-- map('n', '<A-j>', ':m .+1<cr>==', { desc = 'line move down' })
-- map('n', '<A-k>', ':m .-2<cr>==', { desc = 'line move up' })

map('n', '<cr>', 'o<esc>', { desc = 'line insert new' })
-- map('n', '<leader><leader>', 'za', { desc = 'fold toggle' })
map('n', ';;', ':%substitute:::gc<left><left><left><left>', { desc = 'search and replace' })
map('n', 'w!!', 'w !sudo tee % >/dev/null', { desc = 'file sudo safe' })
-- toggle between tabs and spaces
map('n', '<f4>', ':set noexpandtab!<c-m>:set expandtab?<c-m>', { desc = 'F-key toggle tabs or spaces' })
-- toggle scrollbind on and off
map('n', '<f8>', ':set scb!<cr>:set scb?<cr>', { desc = 'F-key toggle scrollbind' })
-- split like in tmux
map('n', '<leader>"', '<cmd>vsplit<cr>', { desc = 'Buffer split horizontal' })
map('n', '<leader>%', '<cmd>split<cr>', { desc = 'Buffer split vertical' })
map('n', 'Q', 'gq', { desc = 'wrap current paragraph' })
map('v', 'Q', 'gq', { desc = 'wrap current selection' })
map('n', '+', '<C-a>', { desc = 'number increment' })
map('n', '-', '<C-x>', { desc = 'number decrement' })
map('v', '<', '<gv', { desc = 'Move selection to the left' })
map('v', '>', '>gv', { desc = 'Move selection to the right' })
-- insert tags for food recipes
map('n', '<leader>tv', 'Go<cr>#vegetarisch<esc>:le4<cr>', { desc = 'tag recipe vegetarisch' })
map('n', '<leader>tV', 'Go<cr>#vegan<esc>:le4<cr>', { desc = 'tag recipe vegan' })
map('n', '<leader>tf', 'Go<cr>#fleisch<esc>:le4<cr>', { desc = 'tag recipe Fleisch' })
map('n', '<leader>tF', 'Go<cr>#fisch<esc>:le4<cr>', { desc = 'tag recipe Fisch' })
map('n', '<leader>td', 'Go<cr>#dessert<esc>:le4<cr>', { desc = 'tag recipe Dessert' })
map('n', '<leader>tA', 'Go<cr>#alkohol<esc>:le4<cr>', { desc = 'tag recipe Alkohol' })
map('n', '<leader>ta', 'Go<cr>#asiatisch<esc>:le4<cr>', { desc = 'tag recipe asiatisch' })
map('n', '<leader>tc', 'Go<cr>#chinesisch<esc>:le4<cr>', { desc = 'tag recipe chinesisch' })
map('n', '<leader>ti', 'Go<cr>#indisch<esc>:le4<cr>', { desc = 'tag recipe indisch' })
map('n', '<leader>tI', 'Go<cr>#italienisch<esc>:le4<cr>', { desc = 'tag recipe italienisch' })
map('n', '<leader>tt', 'Go<cr>#thailändisch<esc>:le4<cr>', { desc = 'tag recipe thailändisch' })
map('n', '<leader>tT', 'Go<cr>#türkisch<esc>:le4<cr>', { desc = 'tag recipe türkisch' })
map('n', '<leader>tl', 'Go<cr>#levante<esc>:le4<cr>', { desc = 'tag recipe levante' })
map('n', '<leader>to', 'Go<cr>#ostern<esc>:le4<cr>', { desc = 'tag recipe Ostern' })
map('n', '<leader>tr', 'Go<cr>#raclette<esc>:le4<cr>', { desc = 'tag recipe Raclette' })
map('n', '<leader>tk', 'Go<cr>#kuchen<esc>:le4<cr>', { desc = 'tag recipe Kuchen' })
map('n', '<leader>ts', 'Go<cr>#salat<esc>:le4<cr>', { desc = 'tag recipe Salat' })
-- InsGitHeader comes from usercmds.lua
map('n', '<leader>ii', '<cmd>InsGitHeader<cr>', { desc = 'insert git header' })
map('n', '<leader>X', '<cmd>!chmod u+x %<cr>', { desc = 'file make executable' })

-- CopyPasteComment is from usercmds.lua
-- mini.comment comes with kickstart-nvim
local status_ok, _ = pcall(require, 'mini.comment')
if status_ok then
  map('n', '<leader>yy', '<cmd>CopyPasteComment<cr>', { desc = 'line copy & paste, preserve as comment' })
end

-- neo-tree comes with kickstart-nvim
status_ok, _ = pcall(require, 'neo-tree')
if status_ok then
  map('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'Neotree' })
end

-- todo-comments comes with kickstart-nvim
status_ok, _ = pcall(require, 'todo-comments')
if status_ok then
  map('n', '<leader>sta', '<cmd>TodoTelescope<cr>', { desc = 'todo: find all todo comments' })
  map('n', '<leader>stt', '<cmd>TodoTelescope keywords=TODO<cr>', { desc = 'todo: find todo comments' })
  map('n', '<leader>stf', '<cmd>TodoTelescope keywords=FIX,FIXME,BUG,ISSUE,FIXIT<cr>', { desc = 'todo: find fixme comments' })
  map('n', '<leader>stn', '<cmd>TodoTelescope keywords=NOTE,INFO<cr>', { desc = 'todo: find note comments' })
end
