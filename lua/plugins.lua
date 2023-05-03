-- Plugins
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

  -- 公共依赖
  use {
    'wbthomason/packer.nvim',
    config = function()
      require("mason").setup()
    end
  }
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  --  LSP管理
  use {"williamboman/mason.nvim"}
  -- use 'williamboman/nvim-lsp-installer'

  -- NOTE: 保证在lsp-config之前
  use {
    "folke/neodev.nvim",
    config = function ()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  }

  -- 通用LSP配置
  use {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    config = function()
      require('plugins.lspconfig')
    end
  }
  --  使用LSP Hook
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins.null-ls')
    end
  }

  -- 代码补全
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
  use 'hrsh7th/cmp-path' -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.nvim-cmp')
    end
  }
  -- 代码片段
  use 'golang/vscode-go'
  use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- 提供了大量的代码片段
  use 'rafamadriz/friendly-snippets'
  -- 像VSCode一样的代码提示弹窗
  use 'onsails/lspkind-nvim'

  -- 文件树
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('plugins.nvim-tree')
    end
  }

  -- 标签栏
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.bufferline')
    end
  }
  -- <leader>q + <leader>aq 快速关闭标签
  use 'moll/vim-bbye'

  -- 语法高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.treesitter')
    end
  }

  -- Themes
  -- use {
  --   'projekt0n/github-nvim-theme',
  --   config = function() require('plugins.github-theme') end
  -- }
  -- use {
  --   "ellisonleao/gruvbox.nvim",
  --   requires = {"rktjmp/lush.nvim"}
  -- }
  -- use 'folke/tokyonight.nvim'
  use {
    "Alexis12119/nightly.nvim",
    config = function()
    end
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end
  }

  -- 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  }

  -- 终端 
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require('plugins.toggleterm')
    end
  }

  -- 文件查找
  use {'nvim-telescope/telescope.nvim'}

  -- 缩进空格高亮
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        filetype_exclude = {"dashboard"},
        show_end_of_line = true,
        show_current_context = true,
        show_current_context_start = true
      }
    end
  }

  -- 辅助快捷键提示
  use {
    "folke/which-key.nvim",
    config = function()
      require('plugins.which-key')
    end
  }

  -- 全局搜索/替换
  use {
    'windwp/nvim-spectre',
    config = function()
      require('spectre').setup()
    end
  }

  -- Markdown预览
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn["mkdp#util#install"]()
    end
  }

  -- 自动闭合标签
  use 'windwp/nvim-ts-autotag'

  -- 快速处理单引号、括号等符号
  use 'tpope/vim-surround'

  -- 快速跳转
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup {}
    end
  }

  -- 代码块颜色区分
  use 'p00f/nvim-ts-rainbow'

  -- 启动页
  -- use {
  --   "glepnir/dashboard-nvim",
  --   -- event = "VimEnter",
  --   -- cond = true,
  --   config = function () require('plugins.dashboard') end 
  -- }

  -- 注释
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      }
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- 更好的搜索展示
  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup({
        calm_down = true
        -- nearest_only = true,
        -- nearest_float_when = 'always'
      })
    end
  }

  -- 颜色高亮
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }

  -- 好看的通知样式
  -- use({
  --   "folke/noice.nvim",
  --   -- event = "VimEnter",
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function() 
  --     require("noice").setup({
  --       -- add any options here
  --     })
  --   end
  -- })

  -- NOTE: 看后面有冒号
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end
  }

  -- 补充缺失的group颜色配置
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  }

  -- 错误列表
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- -- refer to the configuration section below
        -- c = true
      }
    end
  }

  -- 格式化
  -- use { 
    --   'MunifTanjim/prettier.nvim',
    --   config = function() require('plugins.prettier') end
    -- }

  -- use 'mfussenegger/nvim-dap'
  --
  --
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }
  use {
    'mfussenegger/nvim-dap',
    config = function ()
    end
  }
  use {
    "mxsdev/nvim-dap-vscode-js",
    requires = {"mfussenegger/nvim-dap"},
    config = function ()
      require("dap-vscode-js").setup({
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
        -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      })

      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
          }
        }
      end
    end
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function ()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  }

 end)

