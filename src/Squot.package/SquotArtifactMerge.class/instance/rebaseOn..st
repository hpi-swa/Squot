merging
rebaseOn: aSquotArtifactSnapshot
	| newGraphMerge newMetadataMerge |
	newGraphMerge := graphMerge rebaseOn: aSquotArtifactSnapshot objectSnapshot.
	newMetadataMerge := metadataMerge rebaseOn: aSquotArtifactSnapshot artifact storeInfo.
	^ self class new
		setWorking: aSquotArtifactSnapshot
		incoming: incoming
		base: working
		willBeLoaded: true "fake"
		graphMerge: newGraphMerge
		metadataMerge: newMetadataMerge