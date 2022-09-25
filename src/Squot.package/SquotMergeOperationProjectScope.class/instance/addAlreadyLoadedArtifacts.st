as yet unclassified
addAlreadyLoadedArtifacts
	SquotToggles useNewApi
		ifTrue: [mergeOperation mergeVersion snapshot project artifacts do: [:each | mergeOperation workingCopy addIfAlreadyLoaded: each]]
		ifFalse: [mergeOperation workingCopy addGlobalObjectsToStore: mergeOperation mergeVersion].