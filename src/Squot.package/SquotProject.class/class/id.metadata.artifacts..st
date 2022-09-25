instance creation
id: projectId metadata: aDictionary artifacts: aCollection
	^ self new
		setId: projectId metadata: aDictionary artifacts: aCollection;
		yourself.