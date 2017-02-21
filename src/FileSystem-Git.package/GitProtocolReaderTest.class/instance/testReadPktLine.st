tests
testReadPktLine

	self assert: (self newReaderFor: '0006a', String lf) readPktLine equals: 'a'.
	self assert: (self newReaderFor: '0005a') readPktLine equals: 'a'.
	self assert: (self newReaderFor: '000bfoobar', String lf) readPktLine equals: 'foobar'.
	self assert: (self newReaderFor: '0004' readStream) readPktLine equals: ''.
	
	self should: [(self newReaderFor: '000') readPktLine] raise: Error.
	self assert: ((self newReaderFor: '000' )readPktLineIfZero: ['ok']) equals: 'ok'