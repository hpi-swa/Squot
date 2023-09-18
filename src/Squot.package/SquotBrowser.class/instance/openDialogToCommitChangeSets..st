dialog
openDialogToCommitChangeSets: aCollection
	^ self
		openDialogToCommitChangeSets: aCollection
		windowTitle: 'Changes to commit'
		initialMessage: ''
		additionalParents: {}
		materializeChangeSets: false