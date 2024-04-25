-- file: /home/cs/.config/nvim/lua/custom/helper/get-file-name.lua
-- git: nvim (VCSH)
-- author: Christian Schult <cschult@devmem.de> 2023

local M = {}

-- TODO: return complete path + filename if vcsh repo,
-- else return path + filname relativ to the git working dir
function M.get_file_name()
  local bufname = vim.api.nvim_buf_get_name(0)
  -- local filename = bufname:match("^.+/(.+)$")

  -- return filename
  return bufname
end

return M


-- local pfad_datei = '/voll/weit/weg/subdir/readme.txt'
-- local pfad = 'voll/weit/weg'
-- local bufname = vim.api.nvim_buf_get_name(0)
-- pfad = bufname:match('^.+/+')
-- -- local ergebnis = pfad_datei:match(pfad)
-- -- local ergebnis = pfad_datei:match(pfad .. "/")
-- local ergebnis = pfad_datei:match(pfad .. "/" .. "(.+)$")
-- print(ergebnis)
