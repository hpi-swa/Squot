tests
testReadSideBandProgressMessages
	(self newReaderFor: self exampleCompressingMessagesLine)
		readSideBandResponseIfData: [ :data | self fail ]
		ifMessage: [ :data | ^ self assert: data equals: self exampleCompressingMessages  ]
		ifError: [ :data | self fail ]
		ifZero: [ :data | self fail ].
	self fail