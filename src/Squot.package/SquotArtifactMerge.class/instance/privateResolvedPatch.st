private
privateResolvedPatch
	| modification |
	modification := SquotArtifactModification new
		left: working;
		right: incoming;
		diffContent: graphMerge resolvedPatch;
		updateRightArtifact;
		yourself.
	self workingIsLoaded ifTrue: [modification setLoadedInWorkingCopy].
	self willBeLoaded ifTrue: [modification setWillBeLoaded].
	^ modification