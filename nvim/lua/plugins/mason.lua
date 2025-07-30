return {
  "mason-org/mason.nvim",

  config = function()
    require("mason").setup({
      ensure_installed = { 
        "gopls", "go", "gomod", "gowork", "gosum",
        "biome",
        "lua-language-server",
        "typescript-language-server",
        "js-debug-adapter",
      }
    })
  end,
}
