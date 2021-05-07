tests
testSetUpstreamGivenRemoteTrackingBranch
	| remote |
	"given"
	remote := GitRemote name: 'origin' url: ''.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	self unitOfWork addRemote: remote.
	"when"
	self unitOfWork setUpstreamOfBranchNamed: 'mybranch' toTrackedBranchOf: 'refs/remotes/origin/master'.
	"then"
	self assert: 'refs/heads/master' equals: (self unitOfWork configAt: 'branch.mybranch.merge').