comparing
diffAgainst: anArtifact
	| modification |
	modification := SquotArtifactModification left: self right: anArtifact.
	^ (modification hasChanges not and: [(anArtifact respondsTo: #isLoaded) and: [anArtifact isLoaded not]])
		ifTrue: [(SquotArtifactLoad of: anArtifact)
					toggleWhetherToLoad; "not by default"
					yourself]
		ifFalse: [modification]