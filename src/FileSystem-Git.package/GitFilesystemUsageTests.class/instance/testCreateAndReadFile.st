tests
testCreateAndReadFile
	| filename |
	filename := 'missing File'.
	self deny: (workingCopy / filename) exists.
	self
		shouldnt: [ (workingCopy / filename) writeStreamDo: [ :stream |
			stream nextPutAll: 'initial content' ] ]
		raise: FSFileDoesNotExist.
	self assert: (workingCopy readStreamOn: filename) contents asString = 'initial content'