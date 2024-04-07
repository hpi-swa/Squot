actions
actionSwitchToCommit: aCommit displayName: aString updateSymbolicHeadTo: anotherString
	| workingCopy |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	self warnIfImageNotClean: [^ self].
	(self
		openDialogToMaterializeChangeSets: (workingCopy changeSetsFromImageToCommit: aCommit)
		windowTitle: ('Switch to {1}: Load changes from the image to {1}'
						format: {aString}))
			then: [:dialog | workingCopy updateSymbolicHeadTo: anotherString].