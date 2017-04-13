tests
expectedFailures
	(NeedGitCredentials for: self remoteUrl) signal ifNotNil: [^ super expectedFailures].
	^ super expectedFailures , #(testPush testPushCreateUpdateDelete)