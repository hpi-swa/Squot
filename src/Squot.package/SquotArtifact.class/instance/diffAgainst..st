comparing
diffAgainst: anArtifact
	| modification |
	modification := SquotArtifactModification left: self right: anArtifact
		isLoadedInWorkingCopy: ((anArtifact respondsTo: #isLoaded) and: [anArtifact isLoaded])
		contentDiff: (self content squotDiffAgainst: anArtifact content)
		metadataDiff: (self storeInfo squotDiffAgainst: anArtifact storeInfo).
	^ (modification hasChanges not and: [(anArtifact respondsTo: #isLoaded) and: [anArtifact isLoaded not]])
		ifTrue: [(SquotArtifactLoad of: anArtifact)
					toggleWhetherToLoad; "not by default"
					yourself]
		ifFalse: [modification]