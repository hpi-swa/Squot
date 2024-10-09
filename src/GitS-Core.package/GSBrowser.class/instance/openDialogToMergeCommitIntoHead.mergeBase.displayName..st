dialog
openDialogToMergeCommitIntoHead: rightCommit mergeBase: baseCommit displayName: aString
	| headRef currentBranch |
	self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	headRef := self activeWorkingCopy headRef.
	currentBranch := headRef isSymbolic
						ifTrue: [GitReference shortName: headRef targetRef]
						ifFalse: ['HEAD'].
	^ self
		mergeCommitIntoHead: rightCommit
		mergeBase: baseCommit
		message: ('Merge {1} into {2}' format: {aString. currentBranch})
		windowTitle: ('Changes to merge from {1} into {2}' format: {aString. currentBranch})
		alwaysOpenDialog: true
		commitType: #merge