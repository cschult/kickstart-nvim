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
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
  },
}
