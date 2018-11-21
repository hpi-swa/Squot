tests
testHistorianSetUpstreamBranchWithBogusRemoteTrackingBranch
	| bogusTrackingBranch badInvocation |
	self createRemoteTrackingBranchForMaster.
	bogusTrackingBranch := squitRepository historianNamed: 'refs/remotes/bogus/master'.
	badInvocation := [master setUpstreamToBranchTrackedByRemoteTrackingBranch: bogusTrackingBranch].
	self should: badInvocation raise: Error.
	self deny: ((badInvocation on: Error do: [:e | e return: e]) isMemberOf: MessageNotUnderstood)
		description: 'the error should not be a type error'.