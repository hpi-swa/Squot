comparing
diffAgainst: anArtifact
	^ SquotArtifactModification left: self right: anArtifact
		isLoadedInWorkingCopy: ((anArtifact respondsTo: #isLoaded) and: [anArtifact isLoaded])
		contentDiff: (self content squotDiffAgainst: anArtifact content)
		metadataDiff: (self storeInfo squotDiffAgainst: anArtifact storeInfo).