tests
expectedFailures
	self targetClass == GitProtocol ifTrue: [^ #(testPushingABranch "usually disallowed"
		#testUnauthenticatedPushRaisesException "custom error message by GitHub"
		testFetchingABranch testFetchingATag testTags "GitHub: The unauthenticated git protocol on port 9418 is no longer supported. Please see https://github.blog/2021-09-01-improving-git-protocol-security-github/ for more information.")].
	^ super expectedFailures