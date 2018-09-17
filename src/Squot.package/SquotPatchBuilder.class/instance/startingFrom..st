initialize-release
startingFrom: anObjectContainer
	leftArtifacts := anObjectContainer artifacts.
	originalLoadOrder := anObjectContainer loadOrder asOrderedCollection.
	patchedLoadOrder := originalLoadOrder copy.