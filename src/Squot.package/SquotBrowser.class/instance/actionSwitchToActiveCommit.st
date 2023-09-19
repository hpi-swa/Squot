actions
actionSwitchToActiveCommit
	| workingCopy commit |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	commit := self activeCommit.
	(self
		openDialogToMaterializeChangeSets: (workingCopy changeSetsFromImageToCommit: commit)
		windowTitle: ('Switch to {1}' format: {commit showOneLine}))
			then: [:dialog | workingCopy updateHeadTo: commit asHexHash].