instance creation
left: leftArtifact right: rightArtifact
	self flag: #deprecated. 'Compute differences in the caller and use full constructor for the modification instead'.
	^ self new
		diff: leftArtifact against: rightArtifact;
		yourself