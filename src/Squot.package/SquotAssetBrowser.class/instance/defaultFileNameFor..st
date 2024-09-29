requests
defaultFileNameFor: anAssetMapperClass
	^ self formatFileName:
		anAssetMapperClass kind,
		FSPath extensionDelimiter,
		anAssetMapperClass defaultEncodingName