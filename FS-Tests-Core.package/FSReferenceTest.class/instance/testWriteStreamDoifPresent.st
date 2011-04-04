tests
testWriteStreamDoifPresent
	| ref s |
	ref := filesystem referenceTo: 'plonk'.
	ref 
		writeStreamDo:
			[:stream |
			s := stream.
			self assert: stream class = FSWriteStream.
			self assert: stream isOpen]
		ifPresent: [self signalFailure: 'The file does not exist!'].
	self deny: s isOpen
		