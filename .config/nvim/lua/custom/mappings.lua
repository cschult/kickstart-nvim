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
map('n', '<leader>Tv', 'Go<cr>#vegetarisch<esc>:le4<cr>', { desc = 'tag recipe vegetarisch' })
map('n', '<leader>TV', 'Go<cr>#vegan<esc>:le4<cr>', { desc = 'tag recipe vegan' })
map('n', '<leader>Tf', 'Go<cr>#fleisch<esc>:le4<cr>', { desc = 'tag recipe Fleisch' })
map('n', '<leader>TF', 'Go<cr>#fisch<esc>:le4<cr>', { desc = 'tag recipe Fisch' })
map('n', '<leader>Td', 'Go<cr>#dessert<esc>:le4<cr>', { desc = 'tag recipe Dessert' })
map('n', '<leader>TA', 'Go<cr>#alkohol<esc>:le4<cr>', { desc = 'tag recipe Alkohol' })
map('n', '<leader>Ta', 'Go<cr>#asiatisch<esc>:le4<cr>', { desc = 'tag recipe asiatisch' })
map('n', '<leader>Tc', 'Go<cr>#chinesisch<esc>:le4<cr>', { desc = 'tag recipe chinesisch' })
map('n', '<leader>Ti', 'Go<cr>#indisch<esc>:le4<cr>', { desc = 'tag recipe indisch' })
map('n', '<leader>TI', 'Go<cr>#italienisch<esc>:le4<cr>', { desc = 'tag recipe italienisch' })
map('n', '<leader>Tt', 'Go<cr>#thailändisch<esc>:le4<cr>', { desc = 'tag recipe thailändisch' })
map('n', '<leader>TT', 'Go<cr>#türkisch<esc>:le4<cr>', { desc = 'tag recipe türkisch' })
map('n', '<leader>Tl', 'Go<cr>#levante<esc>:le4<cr>', { desc = 'tag recipe levante' })
map('n', '<leader>To', 'Go<cr>#ostern<esc>:le4<cr>', { desc = 'tag recipe Ostern' })
map('n', '<leader>Tr', 'Go<cr>#raclette<esc>:le4<cr>', { desc = 'tag recipe Raclette' })
map('n', '<leader>Tk', 'Go<cr>#kuchen<esc>:le4<cr>', { desc = 'tag recipe Kuchen' })
map('n', '<leader>Ts', 'Go<cr>#salat<esc>:le4<cr>', { desc = 'tag recipe Salat' })
-- InsGitHeader comes from usercmds.lua
map('n', '<leader>ii', '<cmd>InsGitHeader<cr>', { desc = 'insert git header' })
map('n', '<leader>X', '<cmd>!chmod u+x %<cr>', { desc = 'file make executable' })

-- Make adjusting split sizes more friendly
map('n', '<c-right>', ':vertical :resize +3<cr>', { desc = 'split resize vertical +3' })
map('n', '<c-left>', ':vertical :resize -3<cr>', { desc = 'split resize vertical -3' })
map('n', '<c-up>', ':resize +3<cr>', { desc = 'split resize horizontal +3' })
map('n', '<c-down>', ':resize -3<cr>', { desc = 'split resize horizontal -3' })

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

status_ok, _ = pcall(require, 'toggleterm')
if status_ok then
  map('n', '<leader>t', '<cmd>ToggleTerm<cr>', { desc = 'open/close terminal' })
  -- map('t', '<esc>', [[<C-\><C-n>]], { desc = 'terminal escape' })
  map('t', 'jk', [[<C-\><C-n>]], { desc = 'terminal escape' })
  map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'go to window left' })
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'go to window down' })
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'go to window up' })
  map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'go to window right' })
  map('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = 'enter wincmd' })
end

status_ok, _ = pcall(require, 'oil')
if status_ok then
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
end
