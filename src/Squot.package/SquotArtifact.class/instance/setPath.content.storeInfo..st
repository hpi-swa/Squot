initialize-release
setPath: aString content: aShadowGraph storeInfo: aTrackedObjectMetadata
	path := aString.
	content := aShadowGraph.
	storeInfo := aTrackedObjectMetadata.
	id := aTrackedObjectMetadata at: #id ifAbsent: [].