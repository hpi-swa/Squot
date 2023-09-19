actions
actionSwitchToActiveBranch
	| ref |
	ref := self activeRef.
	(self
		openDialogToMaterializeChangeSets: 
			(self workingCopy changeSetsFromImageToCommit: (self unitOfWork objectReferenced: ref))
		windowTitle: ('Switch to {1}' format: {GitReference shortName: ref}))
			then: [:dialog | self workingCopy updateHeadTo: ref].