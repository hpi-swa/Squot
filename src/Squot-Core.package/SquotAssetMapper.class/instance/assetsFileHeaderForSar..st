sar
assetsFileHeaderForSar: aSarBuilder
	^ '| {1} {2} |', String cr,
	'{1} := {3} newWithName: {4}.' format: {
		self sarWorkingCopyVariableName.
		self sarAssetFileVariableName.
		SquotBaseWorkingCopy name.
		aSarBuilder workingCopy name storeString}