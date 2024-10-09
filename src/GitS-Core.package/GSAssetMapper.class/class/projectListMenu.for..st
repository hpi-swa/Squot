menu
projectListMenu: aMenu for: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	aMenu
		add: 'Manage assets'
		target: GSAssetBrowser
		selector: #openOnWorkingCopy:
		argument: aWorkingCopy.