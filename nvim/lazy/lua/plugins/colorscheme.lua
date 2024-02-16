-- install setup colorscheme

return {
  -- add onedark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        transparent = true,
        style = "darker",
        term_colors = true,

        -- toggle theme style ---
        toggle_style_key = "<leader>oc", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        -- Lualine options --
        lualine = {
          transparent = true, -- lualine center bar transparency
        },
      })
      require("onedark").load()
    end,
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
