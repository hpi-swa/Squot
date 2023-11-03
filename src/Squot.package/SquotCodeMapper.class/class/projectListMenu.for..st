as yet unclassified
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'Manage packages'
		target: SquotTonelPackageBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.