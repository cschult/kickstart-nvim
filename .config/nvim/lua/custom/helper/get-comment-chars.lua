-- file: /home/cs/.config/nvim/lua/custom/helper/get-comment-chars.lua
-- git: nvim (VCSH)
-- author: Christian Schult <cschult@devmem.de> 2023

local M = {}

-- function M.get_comment_chars()
--   local ftype = vim.api.nvim_buf_get_option(0, 'filetype')
--   local cLeft = '# '
--   local cRight = ''
--   if ftype == 'vim' then
--     cLeft = '" '
--   elseif ftype == 'lua' then
--     cLeft = '-- '
--   elseif ftype == 'json' then
--     cLeft = '// '
--   elseif ftype == 'c' then
--     cLeft = '/* '
--     cRight = ' */'
--   elseif ftype == 'css' then
--     cLeft = '/* '
--     cRight = ' */'
--   end
--
--   return cLeft, cRight
-- end

function M.get_comment_chars()
  local buffer_number = vim.api.nvim_get_current_buf()
  -- local cLeft = vim.api.nvim_get_option 'commentstring'
  local sep = '%%s'
  local commentstring = vim.api.nvim_get_option_value('commentstring', { buf = buffer_number })
  -- local comments = vim.api.nvim_get_option_value('comments', { buf = buffer_number })
  -- print(commentstring)
  -- print(type(commentstring))
  local t = {}
  for str in string.gmatch(commentstring, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  local cLeft = t[1]
  local cRight = ''
  if t[2] then
    cRight = t[2]
  end
  return cLeft, cRight
end

return M
