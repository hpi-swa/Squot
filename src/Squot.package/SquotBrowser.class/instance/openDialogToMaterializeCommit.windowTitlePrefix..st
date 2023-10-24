dialog
openDialogToMaterializeCommit: aCommit windowTitlePrefix: aString
	^ self
		openDialogToMaterializeCommit: aCommit
		displayName: aCommit showOneLine
		windowTitlePrefix: aString