menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'manage packages'
		target: SquotTonelPackageBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.