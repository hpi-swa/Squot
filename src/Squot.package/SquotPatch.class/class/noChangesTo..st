instance creation
noChangesTo: anObjectContainer
	^ self builder startingFrom: anObjectContainer; updateRightArtifacts; buildPatch