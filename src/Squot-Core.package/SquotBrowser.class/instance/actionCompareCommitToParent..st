actions
actionCompareCommitToParent: aCommit
	| parent |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	parent := aCommit parents ifNotEmpty: #first ifEmpty: [nil].
	self openDialogToShowChangeSetsFromCommit: parent to: aCommit.