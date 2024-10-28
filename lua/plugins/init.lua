-- plugins/init.lua

return {
	-- Example: Lazy plugin manager itself
	{ "folke/lazy.nvim" },

	-- Useful Lua functions used by many plugins
	{ "nvim-lua/plenary.nvim" },

	-- Colorscheme
	{ "folke/tokyonight.nvim" },

	-- Lualine Status Line
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require('lualine').setup {
				options = { theme = 'tokyonight' }
			}
		end
	},

	-- Treesitter for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	},

	{
	  "neovim/nvim-lspconfig",
	  config = function()
	    -- First, require 'lspconfig'
	    local lspconfig = require('lspconfig')

	    -- Setup Pyright for Python
	    -- lspconfig.pyright.setup{}

	    -- Setup clangd for C/C++
	    lspconfig.clangd.setup{}
	  end
	},


 
	-- Completion Engine (nvim-cmp) and LSP completion
	{
	  "hrsh7th/nvim-cmp",
	  config = function()
	    local cmp = require'cmp'
	    cmp.setup({
	      snippet = {
		expand = function(args)
		  vim.fn["vsnip#anonymous"](args.body)  -- For vsnip users, change this for other snippet engines
		end,
	      },
	      mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	      },
	      sources = {
		{ name = 'nvim_lsp' },  -- LSP completions
		{ name = 'buffer' },    -- Buffer completions
		{ name = 'path' },      -- File path completions
		{ name = 'vsnip' },     -- Snippet completions
	      }
	    })
	  end
	},

	-- LSP completion source for nvim-cmp
	{
	  "hrsh7th/cmp-nvim-lsp",
	},

	-- Buffer completion source for nvim-cmp (you already have this)
	{
	  "hrsh7th/cmp-buffer",
	},

	-- Optional: Path completion source for nvim-cmp
	{
	  "hrsh7th/cmp-path",
	},

	-- Snippet engine (optional but recommended for better autocompletion)
	{
	  "hrsh7th/vim-vsnip",
	},

	-- Snippet source for nvim-cmp
	{
	  "hrsh7th/cmp-vsnip",
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end
	},

	-- Comment plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end
	},

	-- Terminal plugin
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end
	},

	-- Tmux Navigator
	{ "christoomey/vim-tmux-navigator" },

 
	{
	  "nvim-tree/nvim-tree.lua",
	  config = function()
	    require("nvim-tree").setup {
	      -- New configuration style with 'on_attach' for key mappings
	      on_attach = function(bufnr)
		local api = require('nvim-tree.api')
		local function opts(desc)
		  return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- Default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- Custom mapping to open file in a new tab
		vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
	      end,
	    }
	  end
	},


	{
	  "ibhagwan/fzf-lua",
	  -- optional for icon support
	  requires = { 'nvim-tree/nvim-web-devicons' },
	  config = function()
	    require("fzf-lua").setup({
	      -- Example configuration for fzf-lua
	      winopts = {
		height = 0.85, -- window height
		width = 0.80,  -- window width
		border = 'single', -- window border
	      },
	      keymap = {
		builtin = {
		  ["<C-f>"] = "preview-page-down",
		  ["<C-b>"] = "preview-page-up",
		},
	      }
	    })
	  end
	},

	{
	  "williamboman/mason.nvim",
	  config = function()
	    require("mason").setup()
	  end
	},


	{
	  "williamboman/mason-lspconfig.nvim",
	  config = function()
	    require("mason-lspconfig").setup {
	      -- ensure_installed = { "pyright" },  -- Add LSPs you want Mason to install automatically
	      automatic_installation = true,  -- Automatically install missing servers
	    }
	  end
	},

	{
	  "folke/which-key.nvim",
	  config = function()
	    require("which-key").setup {
	      -- Add your specific configuration here if needed
	    }
	  end
	},

	{ "ekalinin/Dockerfile.vim" },

	{ "gennaro-tedesco/nvim-peekup"},

	{
		"cbochs/grapple.nvim",

		dependencies = {
			{ "nvim-tree/nvim-web-devicons", lazy = true }
		},
		opts = {
			scope = "git", -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
			{ "<leader>4", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>6", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		},
	},

	--[[ {
	    'goolord/alpha-nvim',
	    dependencies = { 'echasnovski/mini.icons' },
	    config = function ()
		require'alpha'.setup(require'alpha.themes.startify'.config)
	    end
	}, ]]
	{
	    'goolord/alpha-nvim',
	    config = function ()
		require'alpha'.setup(require'alpha.themes.dashboard'.config)
	    end
	},

	
	{
	  "folke/persistence.nvim",
	  event = "BufReadPre", -- Only load when a buffer is read
	  module = "persistence",
	  config = function()
	    require("persistence").setup {
	      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- Save session files here
	      options = {"buffers", "curdir", "tabpages", "winsize"}, -- What to save
	    }
	  end
	},


	{
	  "nvim-telescope/telescope.nvim",
	  tag = "0.1.4",
	  config = function()
	    require('telescope').setup {
	      defaults = {
		file_ignore_patterns = {"node_modules", ".git"},
	      },
	    }
	    require('telescope').load_extension('frecency')
	    require('telescope').load_extension('file_browser')
	  end
	},
	{
	  "nvim-telescope/telescope-frecency.nvim",
	  dependencies = { "tami5/sqlite.lua" }  -- Frecency needs SQLite
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		after = "telescope.nvim"  -- Ensure it loads after telescope
	},



	
	{
	  'mg979/vim-visual-multi',
	  branch = 'master'
	},

	--[[ {
	  'rmagatti/auto-session',
	  config = function()
	    require('auto-session').setup {
	      auto_restore_last_session = true,  -- Updated config syntax
	      log_level = 'info',
	    }
	  end
	}
]]


    -- Add nvim-nio for nvim-dap-ui dependency
    { "nvim-neotest/nvim-nio" },
	{
	    "mfussenegger/nvim-dap",
	    config = function()
		local dap = require("dap")
		-- Load project-specific DAP configuration if available
		local dap_config_path = vim.fn.getcwd() .. "/.nvim-dap.lua"
		dap.adapters.cppdbg = {
		    id = "cppdbg",
		    type = "executable",
		    command = "/home/sam/.vscode/extensions/ms-vscode.cpptools-1.22.10-linux-x64/debugAdapters/bin/OpenDebugAD7",
		    options = {
			detached = false,
		    },
		}
		if vim.fn.filereadable(dap_config_path) == 1 then
		    dofile(dap_config_path)
		else
			dap.configurations.cpp = {
			  {
			    name = "Launch file",
			    type = "cppdbg",
			    request = "launch",
			    program = function()
			      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			    end,
			    cwd = '${workspaceFolder}',
			    stopAtEntry = true,
			  },
			  {
			    name = 'Attach to gdbserver :1234',
			    type = 'cppdbg',
			    request = 'launch',
			    MIMode = 'gdb',
			    miDebuggerServerAddress = 'localhost:1234',
			    miDebuggerPath = '/usr/bin/gdb',
			    cwd = '${workspaceFolder}',
			    program = function()
			      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			    end,
			  },
			}
		end
	    end
	},

	    -- nvim-dap-ui for a UI wrapper around debugging
	    {
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
		config = function()
		    require("dapui").setup()
		    require("dap").listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		    end
		    require("dap").listeners.before.event_terminated["dapui_config"] = function()
			require("dapui").close()
		    end
		    require("dap").listeners.before.event_exited["dapui_config"] = function()
			require("dapui").close()
		    end
		end
	    },

}
