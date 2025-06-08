return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config

  config = function()
    require("auto-session").setup {
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },

      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { "i", "<C-D>" },
        alternate_session = { "i", "<C-S>" },
        copy_session = { "i", "<C-Y>" },
      },
    }

    vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
}
