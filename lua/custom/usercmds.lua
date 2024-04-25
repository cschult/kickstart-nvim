vim.api.nvim_create_user_command('InsGitHeader', function()
  -- Funktionsaufrufe hier
  -- 1. Kommentarzeichen festlegen
  local gcc = require 'custom.helper.get-comment-chars'
  local cLeft, cRight = gcc.get_comment_chars()
  -- 2. Dateinamen festlegen
  local gfn = require 'custom.helper.get-file-name'
  local fname = gfn.get_file_name()
  local line1 = cLeft .. 'file: ' .. fname .. cRight
  -- 3. Repo-Namen festlegen
  local grn = require 'custom.helper.get-repo-name'
  local repo = grn.get_repo_name()
  local line2 = ''
  if repo then
    line2 = cLeft .. 'git: ' .. repo .. cRight
  else
    line2 = cLeft
  end
  -- 4. Autor-Zeile festlegen
  local year = os.date '%Y'
  local line3 = cLeft .. 'author: Christian Schult <cschult@devmem.de> ' .. year .. cRight
  -- empty line
  local newline = ''
  -- 5. alles ausgeben auf mehreren Zeilen
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { line1, line2, line3, newline })
end, { bang = true, desc = 'insert git header' })

vim.api.nvim_create_user_command('CopyPasteComment', function()
  -- gcc is from plugin "Comment.nvim"
  vim.cmd.normal 'yypkgccj'
end, { bang = true, desc = 'Copy line and comment origin' })
