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

    -- Mini Pairs
    require("mini.pairs").setup()

    -- Mini Comment
    require("mini.comment").setup()

    -- Mini Notify
    require('mini.notify').setup({
      -- Notifications about LSP progress
      lsp_progress = {
        enable = true,
        level = 'INFO',
        duration_last = 3000,
      },

    })

    -- Mini Session
    -- https://github.com/echasnovski/mini.sessions?tab=readme-ov-file#default-config
    require("mini.sessions").setup({
      autoread = true,
      autowrite = true,
      file = '', -- don't create Session.vim in cwd
      directory = vim.fn.stdpath('data') .. '/sessions', -- Custom session directory
      verbose = { read = true, write = true }, -- Show messages when writing
    })

    -- Mini Hipatterns
    require('mini.hipatterns').setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

        -- Highlight hex color strings (`#rrggbb`) using that color
        -- hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    -- Mini Starter
    require("mini.starter").setup({
      header = [[
                                                    
             ████ ██████           █████      ██
            ███████████             █████ 
            █████████ ███████████████████ ███   ███████████
           █████████  ███    █████████████ █████ ██████████████
          █████████ ██████████ █████████ █████ █████ ████ █████
        ███████████ ███    ███ █████████ █████ █████ ████ █████
       ██████  █████████████████████ ████ █████ █████ ████ ██████

                                      !! 󰥳  !!
      ]]
    })
  end,
}
