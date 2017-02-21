tests
expectedFailures
	self targetClass == GitProtocol ifTrue: [^ #(testPushingABranch "usually disallowed")].
	^ super expectedFailures