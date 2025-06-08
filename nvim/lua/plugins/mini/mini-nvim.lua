return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    -- Simple and easy statusline.
    require('mini.statusline').setup({
      use_icons = vim.g.have_nerd_font,
    })

    -- Animate common Neovim actions
    require("mini.animate").setup()


    -- Mini Pick
    -- require('mini.pick').setup()

    -- Mini Pairs
    require("mini.pairs").setup()

    -- Mini Comment
    require("mini.comment").setup()

    -- Mini Session
    -- require("mini.sessions").setup()
  end,
}
