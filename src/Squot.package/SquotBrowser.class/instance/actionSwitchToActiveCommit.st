actions
actionSwitchToActiveCommit
	(self
		openDialogToMaterializeChangeSets: (self workingCopy changeSetsFromImageToCommit: self activeCommit)
		windowTitle: ('Switch to {1}' format: {self activeCommit showOneLine}))
			then: [:dialog | self workingCopy updateHeadTo: self activeCommit asHexHash].