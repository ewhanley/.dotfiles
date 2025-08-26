return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"blink.cmp",
		},
		config = function()
			-- Get blink.cmp capabilities
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Global LSP settings
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Python: BasedPyright + Ruff
			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						disableOrganizeImports = true, -- Let Ruff handle imports
						analysis = {
							typeCheckingMode = "standard",
							autoImportCompletions = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			-- Ruff for linting and formatting
			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						organizeImports = true,
						fixAll = true,
					},
				},
			})

			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			-- LSP Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local map = function(m, lhs, rhs, desc)
						vim.keymap.set(m, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
					end

					-- Navigation
					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "gi", vim.lsp.buf.implementation, "Implementation")
					map("n", "gt", vim.lsp.buf.type_definition, "Type Definition")

					-- Documentation
					map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
					map("n", "<leader>K", vim.lsp.buf.signature_help, "Signature Help")

					-- Actions
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>f", function()
						require("conform").format({ async = true, lsp_fallback = true })
					end, "Format")

					-- Diagnostics
					map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
					map("n", "<leader>d", vim.diagnostic.open_float, "Show Diagnostic")
					map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostic List")
				end,
			})

			-- Diagnostics UI
			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
					prefix = "●",
				},
				float = {
					border = "rounded",
				},
				severity_sort = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			-- Set diagnostic signs
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},

	-- Mason: LSP installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- Mason-LSPconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				"basedpyright",
				"ruff",
				"lua_ls",
			},
			automatic_installation = true,
			automatic_enable = {
				exclude = { "pyright" }, -- Don't enable pyright since we use basedpyright
			},
		},
	},

	-- Mason tool installer for formatters/linters
	{
		"WhoIsSethDaniel/mason-tool-installer",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				"ruff", -- Python linter/formatter
				"stylua", -- Lua formatter
				"black", -- Python formatter (optional, as backup)
				"isort", -- Python import sorter (optional, as backup)
			},
		},
	},

	-- Fidget: LSP progress UI
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				display = {
					done_icon = "✓",
				},
			},
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
}