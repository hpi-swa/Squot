sar
addToSar: aSarBuilder
	| assetFile |
	assetFile := (self loadAssetFileFromImage: aSarBuilder workingCopy) ifNil: [^ self].
	self
		addAssetLoaderFileLine: 
			('{1} assetFileAt: {2} put: {3}.' format: {
				self sarAssetLoaderVariableName.
				self path storeString.
				self serializeAssetFile: assetFile toSar: aSarBuilder})
		toSar: aSarBuilder.