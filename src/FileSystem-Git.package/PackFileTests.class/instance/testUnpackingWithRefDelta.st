tests
testUnpackingWithRefDelta
	self usePackWithRefDelta.
	repository withUnitOfWork: [self verifyUnpacking].