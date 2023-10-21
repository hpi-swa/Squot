requests
defaultFileNameFor: anAssetMapperClass
	^ self formatFileName:
		anAssetMapperClass assetTypeName,
		FSPath extensionDelimiter,
		anAssetMapperClass defaultEncodingName