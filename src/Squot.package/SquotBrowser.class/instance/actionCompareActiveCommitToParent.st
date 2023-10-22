actions
actionCompareActiveCommitToParent
	| parent |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	parent := self activeCommit parents ifNotEmpty: #first ifEmpty: [nil].
	self openDialogToShowChangeSetsFromCommit: parent to: self activeCommit.