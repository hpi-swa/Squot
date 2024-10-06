actions
actionSquash: aCommit editMessage: aBoolean
	^ self
		actionPick: aCommit
		message: self activeWorkingCopy headCommit message, String lf, String lf, aCommit message
		windowTitlePrefix: 'Squash'
		revert: false
		amend: true
		alwaysOpenDialog: aBoolean