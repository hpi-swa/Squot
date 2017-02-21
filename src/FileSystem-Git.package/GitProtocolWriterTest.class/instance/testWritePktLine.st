tests
testWritePktLine
	|protocol|
	protocol := self targetClass on: String new writeStream.
	self assert: (protocol encodePktLine: 'a', String lf) equals: '0006a', String lf.
	self assert: (protocol encodePktLine: 'a') equals: '0005a'.
	self assert: (protocol encodePktLine: 'foobar', String lf) equals: '000bfoobar', String lf.
	self assert: (protocol encodePktLine: '') equals: '0004'.