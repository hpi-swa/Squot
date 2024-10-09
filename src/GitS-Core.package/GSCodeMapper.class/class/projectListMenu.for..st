menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'Manage packages'
		target: GSCodePackageBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.