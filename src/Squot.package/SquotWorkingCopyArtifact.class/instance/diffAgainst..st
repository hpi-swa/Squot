comparing
diffAgainst: anArtifact
	| diff |
	diff := artifact diffAgainst: anArtifact.
	self applyLoadStatusTo: diff.
	^ diff