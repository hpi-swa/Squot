testing
canReadVersionFrom: aStream
	[self readVersionFrom: aStream] on: Error do: [^ false].
	^ true