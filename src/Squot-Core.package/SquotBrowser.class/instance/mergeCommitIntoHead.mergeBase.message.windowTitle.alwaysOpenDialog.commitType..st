merging
mergeCommitIntoHead: rightCommit
mergeBase: baseCommit
message: messageString
windowTitle: titleString
alwaysOpenDialog: openDialog
commitType: aSymbol
	| headCommit changeSets additionalParents onlyAdditionalParents |
	self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	headCommit := self activeWorkingCopy headCommit.
	changeSets := self activeWorkingCopy
						mergeCommit: rightCommit
						into: headCommit
						withBase: baseCommit.
	onlyAdditionalParents := false.
	additionalParents := aSymbol caseOf: {
		[#commit] -> [{}].
		[#merge] -> [{rightCommit}].
		[#amend] -> [onlyAdditionalParents := true. headCommit parents]}.
	(openDialog or: [SquotChangeSet anyIncludesConflicts: changeSets]) ifTrue: [
		^ self
			openDialogToCommitChangeSets: changeSets
			windowTitle: (openDialog
							ifTrue: [titleString]
							ifFalse: ['Resolve conflicts to ', titleString withFirstCharacterDownshifted])
			initialMessage: messageString
			additionalParents: additionalParents
			onlyAdditionalParents: onlyAdditionalParents
			materializeChangeSets: true].
	self activeWorkingCopy
		commitChangeSets: changeSets
		message: messageString
		additionalParents: additionalParents
		onlyAdditionalParents: onlyAdditionalParents;
		materializeChangeSets: changeSets.
	^ Promise unit: nil