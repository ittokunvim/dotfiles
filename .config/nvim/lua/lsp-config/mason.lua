local mason = require('mason')

opt_mason = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
}
mason.setup(opt_mason)

