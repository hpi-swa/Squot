tests
testWriteStreamDo
	| ref s |
	ref := filesystem / 'plonk'.
	ref writeStreamDo:
		[:stream |
		s := stream.
		self assert: stream class = FSWriteStream.
		self assert: stream isOpen].
	self deny: s isOpen
		