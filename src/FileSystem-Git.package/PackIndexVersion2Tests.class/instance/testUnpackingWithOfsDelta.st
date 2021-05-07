tests
testUnpackingWithOfsDelta
	self usePackWithOfsDelta.
	repository withUnitOfWork: [self verifyUnpacking]