tests
testWriteStream
	| ref stream |
	ref := filesystem / 'plonk'.
	[stream := ref writeStream.
	self assert: (stream class = FSWriteStream)]
		ensure: [stream ifNotNil: [stream close]]