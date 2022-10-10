-- Plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)

  -- 需要依赖
  use 'wbthomason/packer.nvim'

  -- Fold tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons' -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'moll/vim-bbye' -- for more sensible delete buffer cmd

  -- language
  use 'nvim-treesitter/nvim-treesitter'

  -- Themes
  use 'projekt0n/github-nvim-theme'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- floating terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = 'nightly'
  }

  -- file telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- indent guide
  use "lukas-reineke/indent-blankline.nvim"

  -- startup screen
  -- use 'leslie255/aleph-nvim'

  -- which-key
  use "folke/which-key.nvim"

  -- use {
  --   'goolord/alpha-nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = function()
  --     require'alpha'.setup(require'alpha.themes.startify'.config)
  --   end
  -- }

end)
