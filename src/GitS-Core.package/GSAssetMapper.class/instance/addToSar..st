sar
addToSar: aSarBuilder
	| assetFile |
	assetFile := (self loadAssetFileFromImage: aSarBuilder workingCopy) ifNil: [^ self].
	self
		addAssetsFileLine: 
			('{1} := {2}. {3} addMapper: {1} mapper. {1} mapper materialize: {1} in: {3}.' format: {
				self sarAssetFileVariableName.
				self serializeAssetFile: assetFile toSar: aSarBuilder.
				self sarWorkingCopyVariableName})
		toSar: aSarBuilder.