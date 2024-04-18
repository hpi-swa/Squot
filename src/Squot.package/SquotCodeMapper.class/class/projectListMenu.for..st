menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'Manage packages'
		target: SquotCodePackageBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.