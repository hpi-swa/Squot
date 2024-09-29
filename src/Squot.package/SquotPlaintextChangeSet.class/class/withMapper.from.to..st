instance creation
withMapper: aMapper from: anAssetFile to: anotherAssetFile
	^ (self withMapper: aMapper)
		setChangeFrom: anAssetFile to: anotherAssetFile;
		yourself