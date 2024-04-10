dialog
openDialogToCommitChangeSets: aCollection initialMessage: aString
	^ self
		openDialogToCommitChangeSets: aCollection
		windowTitle: 'Changes to commit'
		initialMessage: aString
		additionalParents: {}
		onlyAdditionalParents: false
		materializeChangeSets: false