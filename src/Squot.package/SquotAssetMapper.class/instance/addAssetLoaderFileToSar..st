sar
addAssetLoaderFileToSar: aSarBuilder
	| member |
	self addAssetLoaderClassToSar: aSarBuilder.
	member := aSarBuilder
					addString: (self assetLoaderFileHeaderForSar: aSarBuilder)
					at: self sarAssetLoaderFileName.
	aSarBuilder
		addPreambleLine:
			('SystemChangeNotifier uniqueInstance doSilently: [self fileInMemberNamed: {1}].'
				format: {self sarAssetLoaderFileName printString});
		addPostAddHook:
			[member contents: (aSarBuilder fixupChunkTerminatorsIn: member contents)].
	^ member