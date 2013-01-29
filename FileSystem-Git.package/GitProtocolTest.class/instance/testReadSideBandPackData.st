tests
testReadSideBandPackData
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleDataLine readStream
		ifData: [:data | ^ self assert: data equals: self examplePackData ]
		ifMessage: [self fail ]
		ifError: [self fail ].
	self fail