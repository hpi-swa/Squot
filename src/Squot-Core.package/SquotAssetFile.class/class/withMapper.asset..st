instance creation
withMapper: aMapper asset: anAsset
	^ self
		withMapper: aMapper
		contents: (ByteArray streamContents: [:stream | aMapper writeAsset: anAsset on: stream])