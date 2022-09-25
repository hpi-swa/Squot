comparing
patchRelativeToBase: aSquotArtifactSnapshot
	^ SquotArtifactMerge into: aSquotArtifactSnapshot merge: self basedOn: aSquotArtifactSnapshot
		willBeLoaded: true "fake"
		graphMerge: (aSquotArtifactSnapshot objectSnapshot squotMergeWith: objectSnapshot basedOn: aSquotArtifactSnapshot objectSnapshot)
		metadataMerge: (aSquotArtifactSnapshot artifact storeInfo squotMergeWith: artifact storeInfo basedOn: aSquotArtifactSnapshot artifact storeInfo)