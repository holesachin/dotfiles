
return {
	"mason-org/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,

	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()
		require('mason-tool-installer').setup({
			ensure_installed = {
				"lua-language-server",         -- Lua LSP
				"gopls",                       -- Go LSP
				"typescript-language-server",  -- TypeScript LSP
				"tailwindcss-language-server", -- Tailwind CSS LSP
				"html-lsp",                    -- HTML LSP
				"css-lsp",                     -- CSS LSP
				"hyprls",
				"nil_ls",

				-- Formatters (for conform.nvim and general use)
				"stylua",
				"goimports",
				-- Note: gofmt comes with Go installation, not managed by Mason
				"prettier",

				-- Linters and diagnostics
				"golangci-lint",
				"eslint_d",
				"luacheck", -- Lua linting

				-- Additional useful tools
				"delve",      -- Go debugger
				"shfmt",      -- Shell formatter
				"shellcheck", -- Shell linter

				-- Optional but useful additions
				"markdownlint", -- Markdown linting
				"yamllint",     -- YAML linting
				"jsonlint",     -- JSON linting
			}

		})
	end
}
