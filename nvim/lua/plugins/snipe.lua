return {
  "leath-dub/snipe.nvim",
  keys = {
    {",", function () require("snipe").open_buffer_menu() end, { desc = "Open Snipe buffer menu" }}
  },
  config = function() 
		require('snipe').setup({
			ui = {
				position = "bottomleft"
			},

			hints = {
				dictionary = "fgjklasioewn"
			},

			navigate = {
				close_buffer = "d",
				open_vplit = "v",
				open_split = "h",
			},

		})
	end
}
