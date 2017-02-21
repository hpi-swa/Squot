tests
testReadSideBandErrorMessage
	(self newReaderFor: self exampleErrorMessageLine)
		readSideBandResponseIfData: [ :data | self fail ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | ^ self assert: data equals: self exampleErrorMessage  ]
		ifZero: [ :data | self fail ].
	self fail