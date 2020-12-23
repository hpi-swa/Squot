merging
mergeWith: otherArtifact basedOn: baseArtifact
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact
		willBeLoaded: false
		graphMerge: (content squotDiffAgainst: otherArtifact content withBase: baseArtifact content)
		metadataMerge: (storeInfo squotMergeWith: otherArtifact storeInfo basedOn: baseArtifact storeInfo)