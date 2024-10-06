sar
addAssetLoaderFileToSar: aSarBuilder
	| member |
	self addAssetLoaderClassToSar: aSarBuilder.
	member := aSarBuilder
					addString: (self assetLoaderFileHeaderForSar: aSarBuilder)
					at: self sarAssetLoaderFileName.
	aSarBuilder
		addPreambleLine:
			('(self memberNamed: {1}) contentStream text; fileInFor: self announcing: ''Loading assets''.'
				format: {self sarAssetLoaderFileName printString});
		addPostAddHook:
			[member contents: (aSarBuilder fixupChunkTerminatorsIn: member contents)].
	^ member