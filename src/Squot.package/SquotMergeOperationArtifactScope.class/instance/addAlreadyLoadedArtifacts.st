as yet unclassified
addAlreadyLoadedArtifacts
	SquotToggles useNewApi
		ifTrue: [mergeOperation workingCopy addIfAlreadyLoaded: artifactToMerge]
		ifFalse: [mergeOperation workingCopy addGlobalObjectsToStore: (SquotSnapshot builder add: artifactToMerge; buildSnapshot)].