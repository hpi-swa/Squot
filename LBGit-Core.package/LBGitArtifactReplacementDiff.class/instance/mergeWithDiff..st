as yet unclassified
mergeWithDiff: anArtifactDiff

	self assert: (anArtifactDiff isKindOf: self class).
	^ anArtifactDiff right diffAgainst: self right