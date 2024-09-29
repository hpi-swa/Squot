testing
canReadAssetFrom: aStream
	[self readAssetFrom: aStream] "attempts to decode the stream as a string"
		ifError: [^ false].
	^ true