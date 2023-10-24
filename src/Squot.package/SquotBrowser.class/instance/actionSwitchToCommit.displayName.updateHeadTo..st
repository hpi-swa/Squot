actions
actionSwitchToCommit: aCommit displayName: aString updateHeadTo: anotherString
	| workingCopy |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	(self
		openDialogToMaterializeChangeSets: (workingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: ('Switch to {1}: load changes from the image to {1}'
						format: {aString}))
			then: [:dialog | workingCopy updateHeadTo: anotherString].