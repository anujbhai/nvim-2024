return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"tailwindcss-language-server",
				"typescript-language-server",
				"eslint-lsp",
				"prettier",
				"js-debug-adapter",
				"lua-language-server",
				"pyright",
			},
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [Actions]")
				nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinitions")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			end
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			local lspconfig = require("lspconfig")
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			-- local servers = { "tsserver", "tailwindcss", "pyright", "lua_ls" }
			--
			-- for _, lsp in ipairs(servers) do
			--   lspconfig[lsp].setup({
			--     on_attach: on_attach,
			--     capabilities: capabilities,
			--   })
			-- end

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "python" },
			})

			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize imports",
					},
				},
			})

			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		end,
	},
}
