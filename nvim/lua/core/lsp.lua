
local diagnostic_severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { source = true },
	signs = {
		text = {
			[diagnostic_severity.ERROR] = "",
			[diagnostic_severity.WARN] = "",
			[diagnostic_severity.INFO] = "",
			[diagnostic_severity.HINT] = "",
		},
		numhl = {
			[diagnostic_severity.ERROR] = "ErrorMsg",
			[diagnostic_severity.WARN] = "WarningMsg",
		},
	},
})
