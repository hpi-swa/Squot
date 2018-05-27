testing
testFindTrackingBranchWithoutMatchingFetchSpec
	| remote |
	remote := GitRemote name: 'origin' url: 'http://example.com/git/example.git'.
	remote addDefaultFetchSpec.
	self shouldNotFindRef: [remote trackingRefOf: 'refs/bogus/master'].