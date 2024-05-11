-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ethanholz/nvim-lastplace',
    lazy = false,
    config = function()
      require('nvim-lastplace').setup {
        lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
        lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    -- leave insert mode with "jk" or "jj"
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
  {
    'Shatur/neovim-session-manager',
    lazy = false,
    config = function()
      local config = require 'session_manager.config'
      require('session_manager').setup {
        autoload_mode = config.AutoloadMode.Disabled,
      }
    end,
    keys = {
      {
        mode = 'n',
        ',ss',
        '<cmd>SessionManager load_session<cr>',
        desc = 'session load',
      },
      {
        mode = 'n',
        ',sl',
        '<cmd>SessionManager load_last_session<cr>',
        desc = 'session load last',
      },
      {
        mode = 'n',
        ',sc',
        '<cmd>SessionManager load_current_dir_session<cr>',
        desc = 'session load current dir',
      },
      {
        mode = 'n',
        ',sS',
        '<cmd>SessionManager save_current_session<cr>',
        desc = 'session save current',
      },
      {
        mode = 'n',
        ',sd',
        '<cmd>SessionManager delete_session<cr>',
        desc = 'session delete',
      },
    },
  },
  {
    -- plugin color-picker is only loaded for css, javascript and html files
    'ziontee113/color-picker.nvim',
    -- lazy = false,
    ft = { 'css', 'javascript', 'html' },
    opts = {},
    keys = {
      {
        mode = { 'n' },
        '<leader>cp',
        '<cmd>PickColor<cr>',
        desc = 'color picker',
      },
      {
        mode = 'i',
        '<C-c>',
        '<cmd>PickColorInsert<cr>',
        desc = 'color picker',
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'declancm/maximize.nvim',
    event = 'VeryLazy',
    config = function()
      require('maximize').setup()
    end,
    keys = {
      {
        '<leader>z',
        mode = { 'n' },
        function()
          require('maximize').toggle()
        end,
        desc = 'maximise view',
      },
    },
  },
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = true,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { mode = 'n', '<leader>C', '<cmd>ChatGPT<cr>', desc = 'chatGPT' },
    },
  },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    config = true,
    lazy = false,
    -- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      {
        mode = 'n',
        '<leader>Vs',
        '<cmd>:VenvSelect<cr>',
        desc = 'venv select',
      },
      {
        mode = 'n',
        '<leader>Vc',
        '<cmd>:VenvSelectCached<cr>',
        desc = 'venv select cached',
      },
    },
    opts = {
      dap_enabled = true,
    },
  },
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'smoka7/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>M',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },
  {
    'delphinus/characterize.nvim',
    lazy = false,
    opts = {},
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'famiu/bufdelete.nvim',
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- set to "tabs" to only show tabpages instead
          themable = true, -- true | false - allows highlight groups to be overriden i.e. sets highlights as default
          numbers = 'ordinal', -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          -- numbers = function(opts)
          --   return string.format('%s %s', opts.ordinal, opts.raise(opts.id))
          -- end,
          close_command = 'Bdelete! %d', -- can be a string | function, | false see "Mouse actions"
          right_mouse_command = 'Bdelete! %d', -- can be a string | function | false, see "Mouse actions"
          left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
          middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- | 'underline' | 'none',
          },
          -- buffer_close_icon = '',
          -- buffer_close_icon = '',
          buffer_close_icon = '󰅙',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          --- name_formatter can be used to change the buffer's label in the bufferline.
          --- Please note some names can/will break the
          --- bufferline so use this at your discretion knowing that it has
          --- some limitations that will *NOT* be fixed.
          --[[ name_formatter = function(buf) -- buf contains:
          name                | str        | the basename of the active file
          path                | str        | the full path of the active file
          bufnr (buffer only) | int        | the number of the active buffer
          buffers (tabs only) | table(int) | the numbers of the buffers in the tab
          tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        end, ]]
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = 'nvim_lsp', -- false | "nvim_lsp" | "coc",
          diagnostics_update_in_insert = false,
          -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
          -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
          diagnostics_indicator = function(count)
            return '(' .. count .. ')'
          end,
          -- NOTE: this will be called a lot so don't do any heavy processing here
          --[[ custom_filter = function(buf_number, buf_numbers)
          -- filter out filetypes you don't want to see
          if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            return true
          end
          -- filter out by buffer name
          if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            return true
          end
          -- filter out based on arbitrary rules
          -- e.g. filter out vim wiki buffer from tabline in your work repo
          if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            return true
          end
          -- filter out by it's index number in list (don't show first buffer)
          if buf_numbers[1] ~= buf_number then
            return true
          end
        end, ]]
          offsets = {
            {
              filetype = 'NvimTree',
              -- text = "File Explorer", -- or a function
              text = 'files', -- or a function
              -- text = "",             -- or a function
              text_align = 'center', -- "left" | "center" | "right"
              separator = true,
            },
          },
          color_icons = true, -- | false, -- whether or not to add the filetype icon highlights
          -- get_element_icon = function(element)
          --[[ get_element_icon = function(buf)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(vim.opt.filetype, { default = false })
          return icon, hl
          -- or
          -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
          -- return custom_map[element.filetype]
        end, ]]
          get_element_icon = function()
            return require('nvim-web-devicons').get_icon_by_filetype(vim.opt.filetype, { default = false })
          end,
          show_buffer_icons = true, -- | false, -- disable filetype icons for buffers
          show_buffer_close_icons = true, -- | false,
          -- NOTE: deprecated
          -- use: get_element_icon = function(buf) return require('nvim-web-devicons').get_icon(..., {default = false})
          -- show_buffer_default_icon = true, --  | false, -- whether or not an unrecognised filetype should show a default icon
          show_close_icon = true, -- | false,
          show_tab_indicators = true, -- | false,
          show_duplicate_prefix = true, -- | false, -- whether to show duplicate buffer prefix
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          -- can also be a table containing 2 custom separators
          -- [focused and unfocused]. eg: { '|', '|' }
          separator_style = 'thick', -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = false, -- | true,
          always_show_bufferline = true, -- | false,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },
          sort_by = 'insert_after_current', -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
          -- or add custom logic
          --  function(buffer_a, buffer_b)
          --    return buffer_a.modified > buffer_b.modified
          --  end
        },
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- require('alpha').setup(require('alpha.themes.dashboard').config)
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
  {
    -- url = 'ssh://devmem.de/srv/git/insgitheader.nvim',
    'cschult/insgitheader.nvim',
    -- dir = '~/git/insgitheader.nvim/',
    lazy = false,
    -- branch = 'develop',
    opts = {
      name = 'Christian Schult',
      email = 'cschult@demem.de',
    },
  },
  {
    'tweekmonster/helpful.vim',
  },
}
