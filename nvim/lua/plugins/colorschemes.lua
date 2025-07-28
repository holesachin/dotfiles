return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
      term_colors = true,

      barbecue = {
        transparent = true,
      },

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
      },

    }
    -- Enable theme
    require('onedark').load()
  end
}
