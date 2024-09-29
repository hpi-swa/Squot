toolbuilder
assetOrNilAsMorph: anAssetOrNil
	^ anAssetOrNil
		ifNil: [(SquotTextUtilities italic: 'Missing') asMorph]
		ifNotNil: [self assetAsMorph: anAssetOrNil]