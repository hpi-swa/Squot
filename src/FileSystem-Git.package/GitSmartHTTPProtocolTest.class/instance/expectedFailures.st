tests
expectedFailures
	(NeedGitCredentials for: self url) signal ifNotNil: [^ super expectedFailures].
	^ super expectedFailures , #(testPushingABranch)