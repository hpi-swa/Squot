tests
testReadPktLine
	| protocol |
	
	protocol := self newProtocol.
	
	self assert: (protocol readPktLine: ('0006a', String lf) readStream) equals: 'a', String lf.
	self assert: (protocol readPktLine: '0005a' readStream) equals: 'a'.
	self assert: (protocol readPktLine: ('000bfoobar', String lf) readStream) equals: 'foobar', String lf.
	self assert: (protocol readPktLine: '0004' readStream) equals: ''.
	
	self should: [protocol readPktLine: '000' readStream] raise: Error.
	self assert: (protocol readPktLine: '000' readStream ifZero: ['ok']) equals: 'ok'