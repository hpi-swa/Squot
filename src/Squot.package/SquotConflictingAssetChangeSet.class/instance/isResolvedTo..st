accessing
isResolvedTo: anAssetFile
	^ self isResolved and: [self resolution = anAssetFile]