caching
cacheSavedArtifacts: aPatch in: aVersion
	"Assume that all artifacts in aVersion that were patched in some way will already have been evaluated. Remember these snapshots for computing a baseSnapshot later."
	aPatch diffsDo:
		[:each |
		each isRemoval not ifTrue:
			[self previouslySavedArtifacts at: each path put: (aVersion artifactAt: each path)]].