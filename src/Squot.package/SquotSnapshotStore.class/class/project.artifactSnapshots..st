instance creation
project: aProject artifactSnapshots: aCollection
	^ self new
		setProject: aProject artifactSnapshots: aCollection;
		yourself