accessing
updateResult
	SquotToggles useNewApi ifFalse: [^ self].
	metadataMerge updateResult.
	graphMerge updateResult.
	result := SquotArtifactSnapshot
		artifact: (SquotArtifact storeInfo: metadataMerge result)
		objectSnapshot: graphMerge result.