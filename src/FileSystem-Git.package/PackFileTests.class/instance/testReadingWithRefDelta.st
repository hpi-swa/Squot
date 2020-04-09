tests
testReadingWithRefDelta
	self usePackWithRefDelta.
	repository withUnitOfWork: [self verifyReadingPackfile].