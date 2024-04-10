actions
actionCherryPick: aCommit
	^ self
		actionPick: aCommit
		message: aCommit message
		windowTitlePrefix: 'Cherry-pick'
		revert: false
		amend: false
		alwaysOpenDialog: false