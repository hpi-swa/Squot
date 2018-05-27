testing
testFindTrackingBranch
	| remote |
	remote := GitRemote name: 'origin' url: 'http://example.com/git/example.git'.
	remote addDefaultFetchSpec.
	self assert: 'refs/remotes/origin/master' equals: (remote trackingRefOf: 'refs/heads/master');
		assert: 'refs/remotes/origin/mybranch' equals: (remote trackingRefOf: 'refs/heads/mybranch').