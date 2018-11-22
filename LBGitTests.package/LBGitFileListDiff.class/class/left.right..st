as yet unclassified
left: leftArtifact right: rightArtifact
	self halt.
	^ self new
		diff: leftArtifact against: rightArtifact;
		yourself