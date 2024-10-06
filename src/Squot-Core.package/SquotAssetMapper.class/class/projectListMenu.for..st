menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'Manage assets'
		target: SquotAssetBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.