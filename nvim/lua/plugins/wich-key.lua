return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	enabled = true,
	event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require('which-key').setup()
	end,
}
