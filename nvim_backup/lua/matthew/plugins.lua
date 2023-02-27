local fn = vim.fn

-- Automatically install packer
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
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- LSP configuration and plugins
	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	})

	-- Formatting and diagnostics server that works with LSP
	use("jose-elias-alvarez/null-ls.nvim")

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"saadparwaiz1/cmp_luasnip", -- snippet completions
		},
	})

	-- Highlight, edit and navigate code
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	-- Fuzzy finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy finder algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Git related plugins
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "f-person/git-blame.nvim" })
	use({ "https://tpope.io/vim/fugitive.git", as = "fugitive" })

	-- Other neovim plugins
	use({ "RRethy/vim-illuminate" }) -- Automatically highlight the word under the cursor
	use("kyazdani42/nvim-web-devicons") -- Cool icons inside telescope and diagnostics etc
	use("kyazdani42/nvim-tree.lua") -- Replacement for netrw / file browser
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("akinsho/toggleterm.nvim") -- Toggle a terminal from inside neovim!
	use("nvim-lualine/lualine.nvim") -- The status bar at the bottom of the screen

	-- Colorschemes
	--[[ use("haishanh/night-owl.vim") ]]
	use("sainnhe/everforest")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Treesitter
	use("JoosepAlviste/nvim-ts-context-commentstring") -- contextual commenting

	-- Package.json
	use({ "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" })

-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
