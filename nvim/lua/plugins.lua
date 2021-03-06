return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Improve startup time
	use("lewis6991/impatient.nvim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
		after = { "nvim-cmp" },
	})

	-- Nicer diagnostics
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup({ auto_preview = false, auto_fold = true })
		end,
	})

	-- Misc
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nathom/filetype.nvim")

	-- Formatter
	use({
		"lukas-reineke/format.nvim",
		config = function()
			require("config.format").setup()
		end,
	})

	-- Display popup with possible keybindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("config.which-key").setup()
		end,
	})

	-- Asynctasks
	use("skywind3000/asyncrun.vim")
	use("skywind3000/asynctasks.vim")

	-- Comment toggler
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Project management
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				require("telescope").load_extension("projects"),
			})
		end,
		requires = { { "nvim-telescope/telescope.nvim" } },
	})

	-- Fuzzy filtering
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope").setup()
		end,
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
		requires = { { "nvim-telescope/telescope.nvim" } },
		run = "make",
	})

	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Colorschema
	use({
		"projekt0n/github-nvim-theme",
		-- config = function() require('github-theme').setup() end
	})

	use({ "EdenEast/nightfox.nvim" })

	-- Color highlighter
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
		ft = { "html", "css", "json", "yaml", "conf" },
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	})

	-- VSCode-like pictograms for neovim lsp completion items
	use("onsails/lspkind-nvim")

	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-calc")

	-- Completion & Snippets
	use({
		"hrsh7th/nvim-cmp",
		after = {
			"lspkind-nvim",
			"LuaSnip",
			"cmp_luasnip",
			"cmp-nvim-lua",
			"cmp-nvim-lsp",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
			"cmp-calc",
		},
		config = function()
			require("config.cmp").setup()
		end,
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	})

	-- Clipboard management
	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup({})
			require("telescope").load_extension("neoclip")
		end,
		requires = { { "nvim-telescope/telescope.nvim" } },
	})

	-- Go development
	use({
		"ray-x/go.nvim",
		config = function()
			require("config.go").setup()
		end,
		run = ':lua require("go.install").install_all()',
		ft = { "go", "gomod" },
	})

	-- Tree
	use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
	}

	-- Treesitter
	-- use({
		-- "nvim-treesitter/nvim-treesitter",
		-- config = function()
			-- require("config.treesitter").setup()
		-- end,
		-- run = ":TSUpdate",
	-- })

	-- Rainbow parentheses by using tree-sitter
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })

	-- Autocreate/update html tags
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Adds indentation guides to all lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent-blankline").setup()
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Github
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})

	use("ruifm/gitlinker.nvim")

	-- Markdown
	-- use({
		-- "iamcco/markdown-preview.nvim",
		-- ft = "markdown",
		-- run = "cd app && yarn install",
	-- })

	-- Lazygit in Neovim
	-- TODO: revisar
	-- use("kdheepak/lazygit.nvim")

	-- Check git history
	use("sindrets/diffview.nvim")


	-- Highlight todo comments
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("config.todo").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	-- Terminal
	use({
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("config.terminal").setup()
		end,
	})

	-- Bookmarks
	use("MattesGroeger/vim-bookmarks")

	use({
		"tom-anders/telescope-vim-bookmarks.nvim",
		config = function()
			require("telescope").load_extension("vim_bookmarks")
		end,
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "MattesGroeger/vim-bookmarks" },
		},
	})

	-- Tabline plugin
	use({
		"romgrk/barbar.nvim",
		config = function()
			require("config.barbar").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Debugging
	-- use({ "mfussenegger/nvim-dap", ft = { "go" } })

	-- use({ "rcarriga/nvim-dap-ui", ft = { "go" }, after = "nvim-dap" })

	-- use({ "theHamsta/nvim-dap-virtual-text", ft = { "go" }, after = "nvim-dap" })
end)
