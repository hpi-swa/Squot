dialog
openDialogToMaterializeCommit: aCommit displayName: aString windowTitlePrefix: anotherString
	^ self
		openDialogToMaterializeChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: anotherString, ('Load changes from the image to {1}' format: {aString}).