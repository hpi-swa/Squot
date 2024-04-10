sar
addAssetLoaderClassToSar: aSarBuilder
	| fileOutPath |
	fileOutPath := self class package name, '.st'.
	aSarBuilder
		addString: self fileOutAssetLoaderClass at: fileOutPath;
		addPreambleLine: ('self fileInMemberNamed: {1}.' format: {fileOutPath printString}).