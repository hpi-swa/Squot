actions
actionReword: aCommit
	^ self
		actionPick: aCommit
		message: aCommit message
		windowTitlePrefix: 'Reword'
		revert: false
		amend: false
		alwaysOpenDialog: true