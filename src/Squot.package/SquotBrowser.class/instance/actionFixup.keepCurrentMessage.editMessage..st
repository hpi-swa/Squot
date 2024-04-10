actions
actionFixup: aCommit keepCurrentMessage: keepCurrentBoolean editMessage: editBoolean
	| message |
	message := keepCurrentBoolean
					ifTrue: [aCommit message]
					ifFalse: [self activeWorkingCopy headCommit message].
	^ self
		actionPick: aCommit
		message: message
		windowTitlePrefix: 'Apply fixup'
		revert: false
		amend: true
		alwaysOpenDialog: editBoolean