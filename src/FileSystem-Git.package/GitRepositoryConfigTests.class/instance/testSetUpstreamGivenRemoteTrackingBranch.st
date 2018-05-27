testing
testSetUpstreamGivenRemoteTrackingBranch
	| remote |
	"given"
	remote := GitRemote name: 'origin' url: ''.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	repository addRemote: remote.
	"when"
	repository setUpstreamOfBranchNamed: 'mybranch' toTrackedBranchOf: 'refs/remotes/origin/master'.
	"then"
	self assert: 'refs/heads/master' equals: (repository configAt: 'branch.mybranch.merge').