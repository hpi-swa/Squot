tests
testReadUntilNAK
	| reader |
	reader := self newReaderFor: #[48 48 48 49 "0001"
		         					       78 65 75 10 "NAK\n"
		             					 00 00 00 00].
	self assert: reader stream position equals: 0.
	reader readUntilNAK.
	self assert: reader stream position equals: 8.