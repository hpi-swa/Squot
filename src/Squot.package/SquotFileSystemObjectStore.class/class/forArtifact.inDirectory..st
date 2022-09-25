instance creation
forArtifact: anArtifact inDirectory: aFSReference
	^ self new
		setProjectRootDirectory: aFSReference;
		yourself