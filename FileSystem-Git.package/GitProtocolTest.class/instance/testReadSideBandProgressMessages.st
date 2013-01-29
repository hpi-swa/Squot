tests
testReadSideBandProgressMessages
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleCompressingMessagesLine readStream
		ifData: [ :data | self fail ]
		ifMessage: [ :data | ^ self assert: data equals: self exampleCompressingMessages  ]
		ifError: [ :data | self fail ].
	self fail