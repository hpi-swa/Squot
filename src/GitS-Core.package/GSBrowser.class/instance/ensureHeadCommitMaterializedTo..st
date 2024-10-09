dialog
ensureHeadCommitMaterializedTo: aString
	| changeSets |
	changeSets := self activeWorkingCopy changeSetsFromImageToHeadCommit.
	(GSChangeSet allEmpty: changeSets) ifTrue: [^ Promise unit: nil].
	(self confirm:
		('To {1}, you cannot have uncommitted changes, but you have some.', String cr,
		'Do you want to DISCARD your uncommitted changes?'
			format: {aString}))
		ifFalse: [^ Promise new "never resolves"].
	^ self
		openDialogToMaterializeChangeSets: changeSets
		windowTitle: ('Discard uncommitted changes in order to {1}' format: {aString})