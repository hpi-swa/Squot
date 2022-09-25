merging
mergeWith: otherArtifact basedOn: baseArtifact
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact
		willBeLoaded: true
		graphMerge: (self content squotMergeWith: otherArtifact content basedOn: baseArtifact content)
		metadataMerge: (self storeInfo squotMergeWith: otherArtifact storeInfo basedOn: baseArtifact storeInfo)