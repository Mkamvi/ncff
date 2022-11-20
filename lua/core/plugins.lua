-- Plugins
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)

  -- 公共依赖
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  --  LSP管理
  use { "williamboman/mason.nvim" }
  -- 通用LSP配置
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  --  使用LSP Hook
  use 'jose-elias-alvarez/null-ls.nvim'

  -- 代码补全
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- 代码片段
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  -- 提供了大量的代码片段
  use 'rafamadriz/friendly-snippets'
  -- 像VSCode一样的代码提示弹窗
  use 'onsails/lspkind-nvim'

  -- 文件树
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- 标签栏
  use {
    'akinsho/bufferline.nvim'
  }
  -- <leader>q + <leader>aq 快速关闭标签
  use 'moll/vim-bbye'

  -- 语法高亮
  use 'nvim-treesitter/nvim-treesitter'

  -- Themes
  use 'projekt0n/github-nvim-theme'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim'
  }

  -- 终端 
  use {
    "akinsho/toggleterm.nvim"
  }

  -- 文件查找
  use {
    'nvim-telescope/telescope.nvim'
  }

  -- 缩进空格高亮
  use "lukas-reineke/indent-blankline.nvim"

  -- 辅助快捷键提示
  use "folke/which-key.nvim"

  -- 全局搜索/替换
  use 'windwp/nvim-spectre'

  -- Markdown预览
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- 自动闭合标签
  use 'windwp/nvim-ts-autotag'

  -- 快速处理单引号、括号等符号
  use 'tpope/vim-surround'

  -- 快速跳转
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  -- 代码块颜色区分
  use 'p00f/nvim-ts-rainbow'

  -- 启动页
  use {
    "glepnir/dashboard-nvim",
    -- event = "VimEnter",
    -- cond = true,
    -- config = [[require('configs.dashboard')]]
  }

  -- 注释
  use {
    'numToStr/Comment.nvim'
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- 更好的搜索展示
  use {'kevinhwang91/nvim-hlslens'}

  -- 高亮区块色
  use 'norcalli/nvim-colorizer.lua'

  -- 好看的通知样式
  use({
    "folke/noice.nvim",
    event = "VimEnter",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- NOTE: 看后面有冒号
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- 补充缺失的group颜色配置
  use 'folke/lsp-colors.nvim'

  -- 错误列表
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  
  -- 格式化
  use('MunifTanjim/prettier.nvim')
end)

