dialog
openDialogToMaterializeCommit: aCommit displayName: aString
	^ self
		openDialogToMaterializeChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: ('Load changes from the image to {1}' format: {aString}).