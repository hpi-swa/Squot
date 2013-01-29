tests
testReadSideBandErrorMessage
	|protocol|
	protocol := self newProtocol.
	protocol
		readSideBandResponseFrom: self exampleErrorMessageLine readStream
		ifData: [ :data | self fail ]
		ifMessage: [ :data | self fail ]
		ifError: [ :data | ^ self assert: data equals: self exampleErrorMessage  ].
	self fail