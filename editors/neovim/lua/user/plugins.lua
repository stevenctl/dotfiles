local fn = vim.fn

-- Packer install
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("installing packer... close and reopen neovim.")
	vim.cmd([[packadd packer.nvim]])
end

-- Reload when we modify plugins file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Exit early on first use where packer isn't installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	-- Deps for many other plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	use("lunarvim/colorschemes") -- Various colorschemes
	use("sainnhe/everforest") -- a4j likes this one
	use("kyazdani42/nvim-web-devicons") -- used by several other packages

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use({
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"hrsh7th/cmp-nvim-lsp", -- lsp completions
		"hrsh7th/cmp-nvim-lua", -- lua and vim config completions
		"hrsh7th/cmp-vsnip", -- snipped completions
		-- "saadparwaiz1/cmp_luasnip", -- snippet completions
		after = { "hrsh7th/nvim-cmp" },
	})

	-- snippets TODO they broke treesitter.. :(
	use("hrsh7th/vim-vsnip")
	-- use("L3MON4D3/LuaSnip") --snippet engine
	-- use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- comments
	use("numToStr/Comment.nvim")

	-- lsp
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- easy install lsp
	use("williamboman/mason-lspconfig.nvim") -- easy install lsp
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})

	-- formatting and linting (also uses mason)
	use("jose-elias-alvarez/null-ls.nvim") -- LSP for lint & format
	use("jayp0521/mason-null-ls.nvim") -- allow mason to manage linters & formatters

	-- DAP
	use("mfussenegger/nvim-dap")
	use("jayp0521/mason-nvim-dap.nvim") -- allow mason to manage DAP
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- Telescope to search the stars...
	use({ "nvim-telescope/telescope.nvim", requires = {
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	} })
	use("nvim-telescope/telescope-media-files.nvim") -- previews

	-- Replace the default "input" and "select" with something prettier
	use({ "stevearc/dressing.nvim" })

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")
	-- Tabline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })

	-- treesitter (lighter than an lsp with lots of the same functionality)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install")
		end,
	})

	-- auto close
	use("windwp/nvim-autopairs") -- add closing paren, quote, etc
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- treesitter friendlyness

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Git gutters
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ numhl = true })
		end,
	})

	-- Trouble - Quickfixlist but nicer
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_jump = {
					"lsp_definitions",
					"lsp_type_definitions",
					"lsp_references",
					"lsp_implementations",
				},
			})
		end,
	})

	-- Help with keymaps
	use("folke/which-key.nvim")

	-- highlight current word
	use("RRethy/vim-illuminate")

	-- dashboard
	use("goolord/alpha-nvim")

	-- projects
	use("ahmedkhalf/project.nvim")

	-- test runner
	use({
		"klen/nvim-test",
		requires = "akinsho/toggleterm.nvim",
		config = function()
			require("nvim-test").setup({ term = "toggleterm" })
		end,
	})

	-- toggleterm
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				-- TODO this must be in sync with keymaps file for which-key to be accurate
				terminal_mappings = true,
				open_mapping = "<leader>`",
			})
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
