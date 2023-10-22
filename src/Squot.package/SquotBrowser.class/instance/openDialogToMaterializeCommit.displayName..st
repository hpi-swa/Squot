dialog
openDialogToMaterializeCommit: aCommit displayName: aString
	^ self
		openDialogToMaterializeChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: ('Materialize changes from the image to {1}' format: {aString}).