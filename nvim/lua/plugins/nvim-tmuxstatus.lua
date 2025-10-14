return {
	"holesachin/tmuxstatus.nvim",
	-- dir = "~/project/tmuxstatus.nvim",
	config = function() 
		require('tmuxstatus').setup({
			update_events = { "BufEnter", "BufLeave", "WinEnter", "ModeChanged" },
			update_interval = 100, -- ms debounce

			widgets = {
				{
					name = "buffers",
					max_length = 80,
					highlight_current = true,
					highlight_format = "#[fg=yellow,bg=black,bold] %s #[default]",
					format = " %s ",
					seperator = " "
				},
				-- {
				-- 	name = "line-count",
				-- 	fn = function()
				-- 		return tostring(vim.api.nvim_buf_line_count(0))
				-- 	end,
				-- 	format = "Lines: %s",
				-- 	tmux_var = "lcount",
				-- 	events = { "BufEnter", "TextChanged" },
				-- },
			},
		})
	end
}
