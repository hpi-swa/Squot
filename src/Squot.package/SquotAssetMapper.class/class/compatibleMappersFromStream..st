encodings
compatibleMappersFromStream: aStream
	^ self validEncodings gather: [:each | | mapper |
		mapper := self new
						encoding: each;
						yourself.
		aStream reset.
		(mapper canReadAssetFrom: aStream)
			ifTrue: [{mapper}]
			ifFalse: [{}]]