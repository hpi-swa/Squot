merging
mergeWith: otherArtifact basedOn: baseArtifact
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact
		willBeLoaded: false
		graphMerge: (content squotMergeWith: otherArtifact content basedOn: baseArtifact content)
		metadataMerge: (storeInfo squotMergeWith: otherArtifact storeInfo basedOn: baseArtifact storeInfo)