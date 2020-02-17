tests
testObjectNamedNil
	self should: [repository objectNamed: nil] raise: Error.