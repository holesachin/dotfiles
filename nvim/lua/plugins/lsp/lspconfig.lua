return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'b0o/schemastore.nvim' },
    { 'folke/neodev.nvim' }
  },
  config = function()
    local icons = require('config.icons')
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
      opts = { buffer = bufnr, silent = true }

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
      -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

      vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
      vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
      vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end)

    local lspconfig = require('lspconfig')

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'ts_ls',
        'eslint',
        'rust_analyzer',
        'gopls',
        'lua_ls',
        'jsonls',
        'bashls',
        'vimls',
        'javasriptreact',
        'typescriptreact',
        'css-lsp',
        'emmet-ls',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
          require('neodev').setup()
        end,

        lspconfig.solidity.setup({
          cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
          filetypes = { "solidity", "sol" },
          root_dir = require("lspconfig.util").find_git_ancestor,
          single_file_support = true,
        }),

        lspconfig.jsonls.setup({
          settings = {
            json = {
              schema = require('schemastore').json.schemas(),
              validate = { enable = true },
            }
          }
        }),

        lspconfig.ts_ls.setup({
          root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
          cmd = { "typescript-language-server", "--stdio" },
        }),

        lspconfig.eslint.setup({
          filestypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
          settings = {
            workingDirectory = { mode = 'auto' },
            format = { enable = true },
            lint = { enable = true },
          },
        }),

        lspconfig.rust_analyzer.setup({
          settings = {
            ["rust-analyzer"] = {
              lens = {
                enable = true,
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              check = {
                enable = true,
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        }),

        lspconfig.gopls.setup({
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            }
          }
        }),

        lspconfig.terraformls.setup({
          cmd = { "terraform-ls", "serve" },
          filetypes = { "terraform", "tf", "terraform-vars" },
          -- root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
          root_dir = lspconfig.util.root_pattern("*.tf", "*.terraform", "*.tfvars", "*.hcl", "*.config"),
        })
      },
    })

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['ts_ls'] = { 'javascript', 'typescript' },
        ['gopls'] = { 'go' },
      }
    })

    lsp_zero.set_preferences({
      suggest_lsp_servers = false,
    })

    lsp_zero.set_sign_icons({
      error = icons.diagnostics.Error,
      warn = icons.diagnostics.Warning,
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
    })

    vim.diagnostic.config({
      title            = false,
      underline        = true,
      virtual_text     = true,
      signs            = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
          { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
        },
      },
      update_in_insert = false,
      severity_sort    = true,
      float            = {
        source = "always",
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
    })
  end
}
