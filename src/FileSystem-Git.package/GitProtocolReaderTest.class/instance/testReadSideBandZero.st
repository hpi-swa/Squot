tests
testReadSideBandZero
	(self newReaderFor: self example4Zeros)
		readSideBandResponseIfData: [ :data | ^ self fail ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | self fail ]
		ifZero: [ ^ self "succeed" ].
	self fail