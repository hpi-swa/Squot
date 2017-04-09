tests
expectedFailures
	GitCredentialsRequest signal ifNotNil: [^ super expectedFailures].
	^ super expectedFailures , #(testPushingABranch)