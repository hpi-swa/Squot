tests
testReadSideBandErrorMessage
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleErrorMessageLine readStream
		ifData: [self fail ]
		ifMessage: [self fail ]
		ifError: [:data | ^ self assert: data equals: self exampleErrorMessage  ].
	self fail