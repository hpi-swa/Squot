tests
testReadSideBandPackData
	(self newReaderFor: self exampleDataLine)
		readSideBandResponseIfData: [ :data | ^ self assert: data equals: self examplePackData ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | self fail ]
		ifZero: [ :data | self fail ].
	self fail