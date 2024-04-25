-- file: /home/cs/.config/nvim/lua/custom/helper/get-comment-chars.lua
-- git: nvim (VCSH)
-- author: Christian Schult <cschult@devmem.de> 2023

local M = {}

function M.get_comment_chars()
  local ftype = vim.api.nvim_buf_get_option(0, 'filetype')
  local cLeft = '# '
  local cRight = ''
  if ftype == 'vim' then
    cLeft = '" '
  elseif ftype == 'lua' then
    cLeft = '-- '
  elseif ftype == 'json' then
    cLeft = '// '
  elseif ftype == 'c' then
    cLeft = '/* '
    cRight = ' */'
  elseif ftype == 'css' then
    cLeft = '/* '
    cRight = ' */'
  end

  return cLeft, cRight
end

return M
