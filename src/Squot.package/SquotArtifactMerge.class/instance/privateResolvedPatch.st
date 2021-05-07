private
privateResolvedPatch
	| modification |
	modification := (SquotArtifactModification
		left: working
		right: incoming
		isLoadedInWorkingCopy: ((working respondsTo: #isLoaded) and: [working isLoaded])
		contentDiff: graphMerge resolvedPatch
		metadataDiff: metadataMerge resolvedPatch)
		updateRightArtifact;
		yourself.
	self workingIsLoaded ifTrue: [modification setLoadedInWorkingCopy].
	self willBeLoaded ifTrue: [modification setWillBeLoaded].
	^ modification