tests
testPeekForNak
	| stream |
	
	stream := #[48 48 48 48] readStream.
	self deny: (self newReaderFor: stream) peekForNAK.
	self assert: stream position equals: 0.
	
	stream := #[78 65 75 10 "NAK\n"] readStream.
	self assert: (self newReaderFor: stream) peekForNAK.
	self assert: stream position equals: 4.