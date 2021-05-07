initialize-release
setWorking: workingArtifact incoming: incomingArtifact base: baseArtifact willBeLoaded: aBoolean graphMerge: anObjectGraphMerge metadataMerge: aTrackedObjectMetadataMerge
	super setWorking: workingArtifact incoming: incomingArtifact base: baseArtifact.
	graphMerge := anObjectGraphMerge.
	willBeLoaded := aBoolean.
	metadataMerge := aTrackedObjectMetadataMerge.