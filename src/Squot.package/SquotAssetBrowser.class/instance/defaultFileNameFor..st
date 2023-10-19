requests
defaultFileNameFor: anAssetMapperClass
	^ (anAssetMapperClass assetTypeName,
		FSPath extensionDelimiter,
		anAssetMapperClass defaultEncodingName) asLowercase