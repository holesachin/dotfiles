return {
	"holesachin/tmuxstatus.nvim",
	-- dir = "~/project/tmuxstatus.nvim",
	config = function() 
		require('tmuxstatus').setup({

			hide_vim_statusbar = true,
			update_events = { "BufEnter", "BufLeave", "WinEnter", "ModeChanged" },
			update_interval = 100, -- ms debounce

			widgets = {
				{
					name = "buffers",
					max_length = 80,
					highlight_current = true,
					highlight_format = "#[fg=green,bold]%s#[default]",
					format = "[ %s ]",
					seperator = " "
				},
				{
					name = "mode",
				},
			},
		})
	end
}
