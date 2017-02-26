tests
testNextPutAllThenNextPut


	stream := filesystem writeStreamOn: 'griffle'.
	stream nextPutAll: 'xxx' asByteArray.
	stream nextPut: 42.
	stream close. 

	stream := filesystem readStreamOn: 'griffle'.
	stream binary.
	self assert: (stream next: 3) asString = 'xxx'.
	self assert: stream next  = 42.