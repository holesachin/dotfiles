return {
  {
    "goolord/alpha-nvim",
    enabled = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                        Enter to the `Hell!` mode!                     ]],
        [[                                                                       ]],
      }

      _Gopts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
      }

      -- local function footer()
      --   return "DO !T."
      -- end

      dashboard.section.buttons.val = {
        -- dashboard.button("f", " " .. " Find file", ":Telescope fd<cr>"),
        -- dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
        -- dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        -- dashboard.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
        -- dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
        -- dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }
      -- dashboard.section.footer.val = footer()

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
}
