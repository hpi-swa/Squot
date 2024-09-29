instance creation
withMapper: aMapper from: anAssetFile to: anotherAssetFile
	^ (self withMapper: aMapper)
		from: anAssetFile;
		to: anotherAssetFile;
		yourself