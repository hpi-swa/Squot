tests
expectedFailures
	self targetClass == GitProtocol ifTrue: [^ #(testPushingABranch "usually disallowed"
		#testUnauthenticatedPushRaisesException "custom error message by GitHub")].
	^ super expectedFailures