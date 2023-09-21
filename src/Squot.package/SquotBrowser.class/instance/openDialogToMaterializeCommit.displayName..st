dialog
openDialogToMaterializeCommit: aCommit displayName: aString
	self
		openDialogToMaterializeChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: ('Materialize {1}' format: {aString}).