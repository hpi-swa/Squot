actions
actionCompareActiveCommitToImage
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	self openDialogToShowChangeSetsFromImageTo: self activeCommit.