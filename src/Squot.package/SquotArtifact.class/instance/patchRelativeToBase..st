comparing
patchRelativeToBase: otherArtifact
	^ SquotArtifactMerge into: otherArtifact merge: self basedOn: otherArtifact
		willBeLoaded: true
		graphMerge: nil
		metadataMerge: (otherArtifact storeInfo squotMergeWith: storeInfo basedOn: otherArtifact storeInfo)