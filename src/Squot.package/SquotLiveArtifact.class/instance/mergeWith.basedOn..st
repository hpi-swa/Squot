merging
mergeWith: otherArtifact basedOn: baseArtifact
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact
		willBeLoaded: true
		graphMerge: (self content squotDiffAgainst: otherArtifact content withBase: baseArtifact content)
		metadataMerge: (self storeInfo squotMergeWith: otherArtifact storeInfo basedOn: baseArtifact storeInfo)