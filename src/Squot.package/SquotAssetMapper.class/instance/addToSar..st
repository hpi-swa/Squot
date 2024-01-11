sar
addToSar: aSarBuilder
	| version |
	version := self loadVersionFromImage: aSarBuilder workingCopy.
	self
		addAssetLoaderFileLine: 
			('{1} assetAt: {2} put: {3}.' format: {
				self sarAssetLoaderVariableName.
				self path storeString.
				version storeString})
		toSar: aSarBuilder.