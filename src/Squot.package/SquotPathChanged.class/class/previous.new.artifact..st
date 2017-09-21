instance creation
previous: previousPathString new: newPathString artifact: anArtifact
	^ self new
		previousPath: previousPathString;
		newPath: newPathString;
		artifact: anArtifact;
		yourself