sar
addToSar: aSarBuilder
	| version |
	version := (self loadVersionFromImage: aSarBuilder workingCopy) ifNil: [^ self].
	self
		addAssetLoaderFileLine: 
			('{1} assetAt: {2} put: {3}.' format: {
				self sarAssetLoaderVariableName.
				self path storeString.
				self serializeVersion: version toSar: aSarBuilder})
		toSar: aSarBuilder.