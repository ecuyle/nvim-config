-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup({
	-- NOTE: First, some plugins that don't require any configuration

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			-- { "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim" },

	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	{ "windwp/nvim-autopairs",                       commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim",                       commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies =
		"nvim-tree/nvim-web-devicons"
	},
	{ "moll/vim-bbye",               commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim",   commit = "a52f078026b27694d2290e34efa61a6e4a690621" },
	{ "akinsho/toggleterm.nvim",     commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" },
	{ "ahmedkhalf/project.nvim",     commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
	{ "lewis6991/impatient.nvim",    commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" },
	{ "goolord/alpha-nvim",          commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },
	{ "karb94/neoscroll.nvim",       commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a" },
	{ "nacro90/numb.nvim",           commit = "d95b7ea62e320b02ca1aa9df3635471a88d6f3b1" },
	{ "folke/trouble.nvim",          commit = "897542f90050c3230856bc6e45de58b94c700bbf" },

	-- Colorschemes
	{ "folke/tokyonight.nvim",       commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" },
	{ "lunarvim/darkplus.nvim",      commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" },
	{ "navarasu/onedark.nvim",       commit = "64fc4bc348e52e8e578beca26021d47c4d272a2a" },
	{ "sainnhe/gruvbox-material",    commit = "af9a1d60ca4d7e2ca34c55c46d1dbea0769d9244" },
	{ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },
	{ "rose-pine/neovim",            name = "rose-pine" },
	{ "ecuyle/ecmax",                name = "ecmax" },

	-- Cmp
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},
	{ "hrsh7th/cmp-buffer",              commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path",                commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip",        commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lua",            commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },

	-- Snippets
	{ "rafamadriz/friendly-snippets",    commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }, -- a bunch of snippets to use

	-- LSP
	{ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }, -- for formatters and linters
	{ "RRethy/vim-illuminate",           commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" },

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"sindrets/diffview.nvim",

	-- Marks
	"theprimeagen/harpoon",

	require("plugins.autoformat"),
	-- require 'plugins.debug',
}, {})
