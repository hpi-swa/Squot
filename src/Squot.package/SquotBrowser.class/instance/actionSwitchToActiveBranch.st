actions
actionSwitchToActiveBranch
	| workingCopy ref |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	ref := self activeRef.
	(self
		openDialogToMaterializeChangeSets: 
			(workingCopy changeSetsFromImageToCommit: (self unitOfWork objectReferenced: ref))
		windowTitle: ('Switch to {1}' format: {GitReference shortName: ref}))
			then: [:dialog | workingCopy updateHeadTo: ref].