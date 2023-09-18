dialog
openDialogToMergeChangeSets: aCollection from: aCommit displayName: aString
	| headRef currentBranch |
	headRef := self workingCopy headRef.
	currentBranch := headRef isSymbolic
						ifTrue: [GitReference shortName: headRef targetRef]
						ifFalse: ['HEAD'].
	^ self
		openDialogToCommitChangeSets: aCollection
		windowTitle: 'Changes to merge'
		initialMessage: ('Merge {1} into {2}' format: {aString. currentBranch})
		additionalParents: {aCommit}
		materializeChangeSets: true