actions
actionRevert: aCommit
	^ self
		actionPick: aCommit
		message: ('Revert {1}' format: {aCommit message printString})
		windowTitlePrefix: 'Revert'
		revert: true
		amend: false
		alwaysOpenDialog: false