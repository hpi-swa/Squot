tests
testReadSideBandProgressMessages
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleCompressingMessagesLine readStream
		ifData: [self fail ]
		ifMessage: [:data | ^ self assert: data equals: self exampleCompressingMessages  ]
		ifError: [self fail ].
	self fail