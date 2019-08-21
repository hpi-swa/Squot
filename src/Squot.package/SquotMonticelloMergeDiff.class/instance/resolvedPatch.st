merging
resolvedPatch
	^ MCPatch operations: (conflicts select: [:each | each remoteChosen] thenCollect: [:each | each operation]), operations