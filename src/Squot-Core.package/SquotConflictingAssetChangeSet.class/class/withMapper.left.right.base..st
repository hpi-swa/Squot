instance creation
withMapper: aMapper left: leftAssetFile right: rightAssetFile base: baseAssetFile
	^ (self withMapper: aMapper)
		left: leftAssetFile;
		right: rightAssetFile;
		base: baseAssetFile;
		yourself