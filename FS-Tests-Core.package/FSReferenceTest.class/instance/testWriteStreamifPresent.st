tests
testWriteStreamifPresent
	| ref stream |
	ref := filesystem referenceTo: 'plonk'.
	[stream := ref writeStreamIfPresent: [self signalFailure: 'Should not reach here'].
	self assert: (stream class = FSWriteStream)]
		ensure: [stream ifNotNil: [stream close]]