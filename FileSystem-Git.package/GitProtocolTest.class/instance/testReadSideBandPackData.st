tests
testReadSideBandPackData
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleDataLine readStream
		ifData: [ :data | ^ self assert: data equals: self examplePackData ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | self fail ].
	self fail