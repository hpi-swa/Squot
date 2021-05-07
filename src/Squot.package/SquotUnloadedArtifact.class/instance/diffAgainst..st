comparing
diffAgainst: anArtifact
	| diff |
	diff := super diffAgainst: anArtifact.
	^ (diff hasChanges not and: [anArtifact isLoadable])
		ifTrue: [(SquotArtifactLoad of: self)
					toggleWhetherToLoad; "not by default"
					yourself]
		ifFalse: [diff]