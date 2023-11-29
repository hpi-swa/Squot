dialog
openDialogToShowChangeSetsFromImageTo: aCommit
	self
		openDialogToShowChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: aCommit)
		fromDisplayName: 'the image'
		toDisplayName: (aCommit ifNotNil: #showOneLine ifNil: ['[no commit]']).