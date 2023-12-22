local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
	"nvim-lua/plenary.nvim",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		-- event = 'InsertEnter',
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-omni",
			"hrsh7th/cmp-emoji",
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{ "SirVer/ultisnips", dependencies = {
		"honza/vim-snippets",
	}, event = "InsertEnter" },
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- dependencies = { "rafamadriz/friendly-snippets" },
	-- 	-- follow latest release.
	-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- 	-- install jsregexp (optional!).
	-- 	build = "make install_jsregexp",
	-- 	config = function()
	-- 		-- require("luasnip.loaders.from_vscode").lazy_load()
	-- 		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/.vsnip" } })
	-- 		-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.g.vsnip_snippet_dir } })
	-- 	end,
	-- },
	-- "saadparwaiz1/cmp_luasnip",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.nvim-tree")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	},
	"moll/vim-bbye",
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("plugins.github-theme")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"windwp/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"windwp/nvim-ts-autotag",
	"tpope/vim-surround",
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			-- local util = require "formatter.util"
			-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					html = {
						require("formatter.filetypes.html").htmlbeautifier,
					},
				},
			})
		end,
	},
	-- "microsoft/vscode-js-debug",
	-- "mfussenegger/nvim-dap",
	-- "mxsdev/nvim-dap-vscode-js",
	-- "rcarriga/nvim-dap-ui",
})
