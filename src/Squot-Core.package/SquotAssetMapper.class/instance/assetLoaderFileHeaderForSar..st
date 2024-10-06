sar
assetLoaderFileHeaderForSar: aSarBuilder
	^ '| {1} |', String cr,
	'{1} := {2} newWithName: {3}.' format: {
		self sarAssetLoaderVariableName.
		GitStandaloneAssetLoader name.
		aSarBuilder workingCopy name storeString}