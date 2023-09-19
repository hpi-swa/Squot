menu
projectListMenu: aMenu for: aWorkingCopy
	aMenu
		add: 'manage packages'
		target: SquotTonelPackageBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.