dialog
openDialogToMergeChangeSets: aCollection from: aCommit displayName: aString
	| headRef currentBranch |
	self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	headRef := self activeWorkingCopy headRef.
	currentBranch := headRef isSymbolic
						ifTrue: [GitReference shortName: headRef targetRef]
						ifFalse: ['HEAD'].
	^ self
		openDialogToCommitChangeSets: aCollection
		windowTitle: ('Changes to merge from {1} into {2}' format: {aString. currentBranch})
		initialMessage: ('Merge {1} into {2}' format: {aString. currentBranch})
		additionalParents: {aCommit}
		materializeChangeSets: true