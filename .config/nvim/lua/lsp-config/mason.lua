local mason = require('mason')
local opts = {}

opts.ui = {
	icons = {
		package_installed = "✓",
		package_pending = "➜",
		package_uninstalled = "✗"
	}
}

mason.setup(opts)
