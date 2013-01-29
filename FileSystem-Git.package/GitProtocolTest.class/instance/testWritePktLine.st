tests
testWritePktLine
	|protocol|
	protocol := self newProtocol.
	self assert: (protocol writePktLine: 'a', String lf) equals: '0006a', String lf.
	self assert: (protocol writePktLine: 'a') equals: '0005a'.
	self assert: (protocol writePktLine: 'foobar', String lf) equals: '000bfoobar', String lf.
	self assert: (protocol writePktLine: '') equals: '0004'.