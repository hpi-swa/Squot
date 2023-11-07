testing
canReadVersionFrom: aStream
	[self readVersionFrom: aStream] "attempts to decode the stream as a string"
		ifCurtailed: [^ false].
	^ true