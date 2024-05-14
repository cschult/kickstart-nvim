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
    config = true,
    -- config = function()
    -- require('better_escape').setup()
    -- end,
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
  -- {
  -- plugin color-picker is only loaded for css, javascript and html files
  --   'ziontee113/color-picker.nvim',
  --   -- lazy = false,
  --   ft = { 'css', 'javascript', 'html' },
  --   config = true,
  --   keys = {
  --     {
  --       mode = { 'n' },
  --       '<leader>cp',
  --       '<cmd>PickColor<cr>',
  --       desc = 'color picker',
  --     },
  --     {
  --       mode = 'i',
  --       '<C-c>',
  --       '<cmd>PickColorInsert<cr>',
  --       desc = 'color picker',
  --     },
  --   },
  -- },
  {
    'max397574/colortils.nvim',
    cmd = 'Colortils',
    config = true,
    keys = {
      {
        mode = { 'n' },
        '<leader>cp',
        '<cmd>Colortils<cr>',
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
    config = true,
    -- config = function()
    --   require('maximize').setup()
    -- end,
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
    config = true,
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
    config = true,
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
          numbers = 'ordinal',

          -- Bdelete is from plugin bufdelete.nvim
          close_command = 'Bdelete! %d',
          right_mouse_command = 'Bdelete! %d',
          buffer_close_icon = '󰅙',
          diagnostics = 'nvim_lsp',
          diagnostics_update_in_insert = true,
          diagnostics_indicator = function(count)
            return '(' .. count .. ')'
          end,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'files',
              text_align = 'center',
              separator = true,
            },
          },
          get_element_icon = function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
          end,
          separator_style = 'thick',
          sort_by = 'insert_after_current',
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
    config = true,
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
    url = 'ssh://devmem.de/srv/git/insgitheader.nvim',
    -- 'cschult/insgitheader.nvim',
    -- dir = '~/git/insgitheader.nvim/',
    lazy = false,
    branch = 'develop',
    opts = {
      name = 'Christian Schult',
      email = 'cschult@demem.de',
    },
  },
  {
    'tweekmonster/helpful.vim',
  },
}
