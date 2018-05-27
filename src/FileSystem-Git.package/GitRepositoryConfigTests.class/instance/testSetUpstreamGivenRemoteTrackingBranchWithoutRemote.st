testing
testSetUpstreamGivenRemoteTrackingBranchWithoutRemote
	| badInvocation error |
	"given"
	self assert: (repository configAt: 'remote.origin.fetch') isNil.
	"when"
	badInvocation := [repository setUpstreamOfBranchNamed: 'mybranch' toTrackedBranchOf: 'refs/remotes/origin/master'].
	"then"
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.