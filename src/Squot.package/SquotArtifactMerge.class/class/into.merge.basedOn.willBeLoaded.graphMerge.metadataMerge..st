instance creation
into: workingArtifact merge: incomingArtifact basedOn: baseArtifact willBeLoaded: aBoolean graphMerge: anObjectGraphMerge metadataMerge: aTrackedObjectMetadataMerge
	^ self new
		setWorking: workingArtifact
		incoming: incomingArtifact
		base: baseArtifact
		willBeLoaded: aBoolean
		graphMerge: anObjectGraphMerge
		metadataMerge: aTrackedObjectMetadataMerge;
		updateResult;
		yourself