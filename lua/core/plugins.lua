-- Plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)

  -- 公共依赖
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- 一些常用的LSP配置  有些插件还有依赖
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  --  使用LSP Hook
  use 'jose-elias-alvarez/null-ls.nvim'


  use('MunifTanjim/prettier.nvim')
  
  -- 代码补全
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  -- 提供了大量的代码片段
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  -- 像VSCode一样的代码提示弹窗
  use 'onsails/lspkind-nvim'

  -- Fold tree
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim'
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
    'nvim-lualine/lualine.nvim'
  }

  -- floating terminal
  use {
    "akinsho/toggleterm.nvim"
  }

  -- 文件查找
  use {
    'nvim-telescope/telescope.nvim'
  }

  -- indent guide
  use "lukas-reineke/indent-blankline.nvim"

  -- which-key
  use "folke/which-key.nvim"

  use 'goolord/alpha-nvim'

  use "lukas-reineke/lsp-format.nvim"
  use 'windwp/nvim-spectre'

  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }


  use 'windwp/nvim-ts-autotag'
  use 'tpope/vim-surround'
  -- use {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end
  -- }
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }
  use 'p00f/nvim-ts-rainbow'
  use 'glepnir/dashboard-nvim'
  use {
    'numToStr/Comment.nvim'
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {'kevinhwang91/nvim-hlslens'}
  use 'norcalli/nvim-colorizer.lua'
  -- Packer
  use({
    "folke/noice.nvim",
    event = "VimEnter",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
  -- use { 'folke/todo-comments.nvim', config = "require('plugins.todo-comments')" }
  use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

  -- use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

end)

