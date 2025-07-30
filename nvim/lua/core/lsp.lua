vim.lsp.enable({
  "gopls",
  "lua_ls",
  "ts_ls",
})

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

-- -- C/C++ {{{
-- vim.lsp.config.clangd = {
--   cmd = {
--     "clangd",
--     "-j=" .. 2,
--     "--background-index",
--     "--clang-tidy",
--     "--inlay-hints",
--     "--fallback-style=llvm",
--     "--all-scopes-completion",
--     "--completion-style=detailed",
--     "--header-insertion=iwyu",
--     "--header-insertion-decorators",
--     "--pch-storage=memory",
--   },
--   filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--   root_markers = {
--     "CMakeLists.txt",
--     ".clangd",
--     ".clang-tidy",
--     ".clang-format",
--     "compile_commands.json",
--     "compile_flags.txt",
--     "configure.ac",
--     ".git",
--     vim.uv.cwd(),
--   },
-- }
--
-- -- Rust {{{
-- vim.lsp.config.rust_analyzer = {
--   filetypes = { "rust" },
--   cmd = { "rust-analyzer" },
--   workspace_required = true,
--   root_dir = function(buf, cb)
--     local root = vim.fs.root(buf, { "Cargo.toml", "rust-project.json" })
--     local out = vim.system({ "cargo", "metadata", "--no-deps", "--format-version", "1" }, { cwd = root }):wait()
--     if out.code ~= 0 then
--       return cb(root)
--     end
--
--     local ok, result = pcall(vim.json.decode, out.stdout)
--     if ok and result.workspace_root then
--       return cb(result.workspace_root)
--     end
--
--     return cb(root)
--   end,
--   settings = {
--     autoformat = false,
--     ["rust-analyzer"] = {
--       check = {
--         command = "clippy",
--       },
--     },
--   },
-- }
--
-- -- Typst {{{
-- vim.lsp.config.tinymist = {
--   cmd = { "tinymist" },
--   filetypes = { "typst" },
--   root_markers = { ".git", vim.uv.cwd() },
-- }
--
-- -- Bash {{{
-- vim.lsp.config.bashls = {
--   cmd = { "bash-language-server", "start" },
--   filetypes = { "bash", "sh", "zsh" },
--   root_markers = { ".git", vim.uv.cwd() },
--   settings = {
--     bashIde = {
--       globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
--     },
--   },
-- }

