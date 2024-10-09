actions
actionCommit
	self activeWorkingCopyIfNilInformAnd: [^ self].
	self openDialogToCommitImageWithInitialMessage: ''.