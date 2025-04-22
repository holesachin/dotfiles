return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
      })
      require("tokyonight").load()

      -- Optionally apply transparency to other components of Minifiles if needed
      vim.api.nvim_set_hl(0, 'Minifiles', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'MiniFilesNormal', { bg = 'NONE', fg = '#FFFFFF' })    -- Adjust fg color as needed
      vim.api.nvim_set_hl(0, 'MiniFilesBorder', { bg = 'NONE', fg = '#AAAAAA' })    -- For borders, if applicable
      vim.api.nvim_set_hl(0, 'MiniFilesDirectory', { bg = 'NONE', fg = '#87D7FF' }) -- Directory names
      vim.api.nvim_set_hl(0, 'MinifilesTitle', { bg = 'none' })                     -- Ensures Minifiles title bar is transparen
      vim.api.nvim_set_hl(0, 'MinifilesTitleFocused', { bg = 'none' })              -- Ensures focused title bar is transparent
      vim.api.nvim_set_hl(0, 'MinifilesStatus', { bg = 'none' })                    -- Ensures status line is transparent
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    enabled = true,
    priority = 1000, -- Ensure it loads first
  },
}
