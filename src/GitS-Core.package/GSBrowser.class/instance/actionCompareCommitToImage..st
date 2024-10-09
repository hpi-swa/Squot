actions
actionCompareCommitToImage: aCommit
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self openDialogToShowChangeSetsFromImageTo: aCommit.