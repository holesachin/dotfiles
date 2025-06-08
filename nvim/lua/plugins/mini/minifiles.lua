return {
    "echasnovski/mini.files",

    require("mini.files").setup({
        mappings = {
            go_in      = 'L',
            go_in_plus = 'l',
        },

        options = {
            use_as_default_explorer = true,
            permanent_delete = false,
        },

        windows = {
            preview = true,

            width_focus = 30,
            width_preview = 70,
        },

        -- open&close minifiles
        vim.keymap.set('n', '<leader>n', '<Cmd>lua MiniFiles.open()<CR>',
            { silent = true, desc = "Open MiniFiles in current working Directory." }),
        vim.keymap.set('n', '<Esc>', '<Cmd>lua MiniFiles.close()<CR>', { silent = true, desc = "Close MiniFiles." }),
        vim.keymap.set('n', '<leader>m', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>',
            { silent = true, desc = "Open MiniFiles in current 'FILEs' Directory." }),

        -- Custom Keymaps
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "minifiles",
            callback = function()
                -- import minifiles module
                local mini_files = require('mini.files')

                -- open new tmux pane in selected directory
                vim.keymap.set("n", ",", function()
                    -- Get the current entry using 'get_fs_entry()'
                    local curr_entry = mini_files.get_fs_entry()
                    if curr_entry and curr_entry.fs_type == "directory" then
                        -- Call tmux pane function with the directory path
                        vim.system({ "tmux", "split-window", "-v", "-l", "20%", "-c", curr_entry.path })
                    else
                        -- Notify if not a directory or no entry is selected
                        vim.notify("Not a directory or no entry selected", vim.log.levels.WARN)
                    end
                end, { buffer = true, noremap = true, silent = true })

                -- zip selected directory
                vim.keymap.set("n", "<leader>z", function()
                    -- Get the current entry using 'get_fs_entry()'
                    local curr_entry = mini_files.get_fs_entry()
                    local dir_name = vim.fs.basename(curr_entry.path)

                    if curr_entry and curr_entry.fs_type == "directory" then
                        -- Call tmux pane function with the directory path
                        vim.system({ "zip", "-r", dir_name .. ".zip", curr_entry.path })
                        vim.notify("Zip file created", vim.log.levels.INFO)
                    else
                        -- Notify if not a directory or no entry is selected
                        vim.notify("Not a directory or no entry selected", vim.log.levels.WARN)
                    end
                end, { buffer = true, noremap = true, silent = true })

                -- preview image in sxiv
                vim.keymap.set("n", "<space>pi", function()
                    local curr_entry = mini_files.get_fs_entry()
                    if curr_entry then
                        -- Preview the file using Quick Look
                        vim.system({ "sxiv", "-b", curr_entry.path }, {
                            stdout = false,
                            stderr = false,
                        })
                    end
                end, { buffer = true, noremap = true, silent = true, desc = "Preview image with sxiv." })
            end
        }),

        -- Customize highlights for transparency
        vim.api.nvim_set_hl(0, 'Minifiles', { bg = 'none' }),
        vim.api.nvim_set_hl(0, 'MiniFilesNormal', { bg = 'NONE', fg = '#dbceba' }), -- Adjust fg color as needed
        vim.api.nvim_set_hl(0, 'MiniFilesBorder', { bg = 'NONE', fg = '#57544d' }), -- For borders, if applicable
        vim.api.nvim_set_hl(0, 'MiniFilesDirectory', { bg = 'NONE', fg = '#87D7FF' }), -- Directory names
        vim.api.nvim_set_hl(0, 'MinifilesTitle', { bg = 'none' }),                 -- Ensures Minifiles title bar is transparen
        vim.api.nvim_set_hl(0, 'MinifilesTitleFocused', { bg = 'none' }),          -- Ensures focused title bar is transparent
        vim.api.nvim_set_hl(0, 'MinifilesStatus', { bg = 'none' }),                -- Ensures status line is transparent
    })
}
