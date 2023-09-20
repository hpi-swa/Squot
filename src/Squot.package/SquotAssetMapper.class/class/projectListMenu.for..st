menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'manage assets'
		target: SquotAssetBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.