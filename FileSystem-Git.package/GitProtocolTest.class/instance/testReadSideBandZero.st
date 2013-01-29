tests
testReadSideBandZero
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self example4Zeros readStream
		ifData: [ :data | ^ self fail ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | self fail ]
		ifZero: [ ^ self "succeed" ].
	self fail