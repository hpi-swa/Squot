tests
testObjectNamedNil
	self should: [self unitOfWork objectNamed: nil] raise: Error.