dialog
openDialogToShowChangeSetsFromCommit: aCommit to: anotherCommit
	self
		openDialogToShowChangeSets:
			(self activeWorkingCopy changeSetsFromCommit: aCommit toCommit: anotherCommit)
		fromDisplayName: (aCommit ifNotNil: #showOneLine ifNil: ['[no commit]'])
		toDisplayName: (anotherCommit ifNotNil: #showOneLine ifNil: ['[no commit]']).