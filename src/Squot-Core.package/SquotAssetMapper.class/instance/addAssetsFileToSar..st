sar
addAssetsFileToSar: aSarBuilder
	| member |
	self addSquotInstallLineToSar: aSarBuilder.
	member := aSarBuilder
					addString: (self assetsFileHeaderForSar: aSarBuilder)
					at: self sarAssetsFileName.
	aSarBuilder
		addPreambleLine:
			('(self memberNamed: {1}) contentStream text; fileInFor: self announcing: ''Loading assets''.'
				format: {self sarAssetLoaderFileName storeString});
		addPostAddHook:
			[member contents: (aSarBuilder fixupChunkTerminatorsIn: member contents)].
	^ member