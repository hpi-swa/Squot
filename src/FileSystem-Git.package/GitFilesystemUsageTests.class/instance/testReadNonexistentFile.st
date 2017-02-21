tests
testReadNonexistentFile
	self 
		should: [ workingCopy readStreamOn: 'missing File' ]
		raise: FileDoesNotExist