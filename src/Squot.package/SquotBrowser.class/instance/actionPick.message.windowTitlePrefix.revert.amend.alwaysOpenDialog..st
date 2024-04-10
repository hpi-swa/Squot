actions
actionPick: aCommit
message: messageString
windowTitlePrefix: windowTitleString
revert: revertBoolean
amend: amendBoolean
alwaysOpenDialog: dialogBoolean
	| parent |
	parent := self parentForPick: aCommit.
	^ self
		mergeCommitIntoHead: (revertBoolean ifTrue: [parent] ifFalse: [aCommit])
		mergeBase: (revertBoolean ifTrue: [aCommit] ifFalse: [parent])
		message: messageString
		windowTitle: ('{1} {2}' format: {windowTitleString. aCommit showOneLine})
		alwaysOpenDialog: dialogBoolean
		commitType: (amendBoolean ifTrue: [#amend] ifFalse: [#commit])