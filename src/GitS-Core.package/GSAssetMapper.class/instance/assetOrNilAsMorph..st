toolbuilder
assetOrNilAsMorph: anAssetOrNil
	^ anAssetOrNil
		ifNil: [(GSTextUtilities italic: 'Missing') asMorph]
		ifNotNil: [self assetAsMorph: anAssetOrNil]