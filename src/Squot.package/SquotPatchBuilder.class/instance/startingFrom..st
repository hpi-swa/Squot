initialize-release
startingFrom: anObjectContainer
	base := anObjectContainer.
	leftArtifacts := anObjectContainer artifacts.
	originalLoadOrder := anObjectContainer loadOrder asOrderedCollection.
	patchedLoadOrder := originalLoadOrder copy.
	loadOrderDiff := nil.
	loadOrderMerge := nil.