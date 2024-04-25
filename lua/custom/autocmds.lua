local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- RECIPE FILES
augroup('recipeFiles', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*/Rezepte/*.txt' },
  group = 'recipeFiles',
  command = 'setlocal textwidth=85',
})
autocmd('BufWritePre', {
  pattern = { '*/Rezepte/*.txt' },
  group = 'recipeFiles',
  callback = function()
    vim.cmd [[ %le4 ]]
    vim.cmd [[ %s:^    $::ge ]]
  end,
})

-- FILETYPE SETTINGS
--
-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua' },
  command = 'setlocal shiftwidth=2 tabstop=2',
})

-- MUTT
augroup('muttFiles', { clear = true })
autocmd({ 'BufNewFile', 'BufRead' }, {
  group = 'muttFiles',
  pattern = { '.article*', '.followup', '.letter*', '/tmp/mutt-*' },
  callback = function()
    vim.cmd [[ setlocal nobackup ]]
    vim.cmd [[ setlocal nofoldenable ]]
    vim.cmd [[ normal gg}j ]]
  end,
})

-- ZSH
augroup('zshFiles', { clear = true })
autocmd({ 'BufRead' }, {
  group = 'zshFiles',
  pattern = { 'generic.zshrc', '.zshrc', '.zshrc.local' },
  command = 'setlocal filetype=zsh',
})

-- GENERAL SETTINGS

-- Remove trailing whitespace on save
augroup('GeneralSettings', { clear = true })
autocmd('BufWritePre', {
  group = 'GeneralSettings',
  pattern = '',
  command = ':%s/\\s\\+$//e',
})

augroup('Python', { clear = true })
autocmd({ 'FileType' }, {
  group = 'Python',
  pattern = 'python',
  command = 'setlocal colorcolumn=80',
})
