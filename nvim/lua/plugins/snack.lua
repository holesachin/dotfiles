return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      enabled = true,
    },

    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
  }
}
