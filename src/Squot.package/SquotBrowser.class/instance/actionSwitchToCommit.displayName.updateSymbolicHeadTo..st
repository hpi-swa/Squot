actions
actionSwitchToCommit: aCommit displayName: aString updateSymbolicHeadTo: anotherString
	| workingCopy commit |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	self warnIfImageNotClean: [^ self].
	commit := aCommit.
	(workingCopy importSquotContentsFromCommit: commit) ifNotNil: [:newCommit |
		commit := newCommit.
		(workingCopy isSqueakBranchRef: anotherString) ifTrue: [
			workingCopy updateRef: anotherString toNewCommit: commit]].
	(self
		openDialogToMaterializeChangeSets: (workingCopy changeSetsFromImageToCommit: commit)
		windowTitle: ('Switch to {1}: Load changes from the image to {1}'
						format: {aString}))
			then: [:dialog | workingCopy updateSymbolicHeadTo: anotherString].