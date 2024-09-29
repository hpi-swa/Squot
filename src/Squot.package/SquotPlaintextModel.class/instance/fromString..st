conversion
fromString: aString
	^ self mapper assetAsAssetFile: (self mapper toPlaintext: aString)