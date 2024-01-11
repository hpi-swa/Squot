sar
assetLoaderFileInSar: aSarBuilder
	^ (aSarBuilder zip memberNamed: self sarAssetLoaderFileName)
		ifNil: [self addAssetLoaderFileToSar: aSarBuilder]