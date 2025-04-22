-- Neovide

if vim.g.neovide then
  -- Font
  vim.o.guifont = "ShureTechMono Nerd Font Mono:h7"

  -- Padding
  vim.g.neovide_padding_top = 3
  vim.g.neovide_padding_bottom = 3
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Transparency
  vim.g.neovide_transparency = 0.9
  vim.g.transparency = 1
  vim.g.neovide_background_color = "#282828"

  -- Blur
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Theme
  vim.g.neovide_theme = 'auto'

  -- Refresh Rate
  vim.g.neovide_refresh_rate = 60

  -- VFX
  -- produce particles behind the cursor, if want to disable them, set it to ""
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"

  -- Animation
  vim.g.neovide_cursor_animation_length = 0.10
end
