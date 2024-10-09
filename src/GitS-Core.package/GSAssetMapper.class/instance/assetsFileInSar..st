sar
assetsFileInSar: aSarBuilder
	^ (aSarBuilder zip memberNamed: self sarAssetsFileName)
		ifNil: [self addAssetsFileToSar: aSarBuilder]