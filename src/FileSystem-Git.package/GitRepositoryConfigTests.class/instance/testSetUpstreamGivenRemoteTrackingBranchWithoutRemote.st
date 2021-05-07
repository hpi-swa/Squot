tests
testSetUpstreamGivenRemoteTrackingBranchWithoutRemote
	| badInvocation error |
	"given"
	self assert: (self unitOfWork configAt: 'remote.origin.fetch') isNil.
	"when"
	badInvocation := [self unitOfWork setUpstreamOfBranchNamed: 'mybranch' toTrackedBranchOf: 'refs/remotes/origin/master'].
	"then"
	error := self exception: Error raisedBy: badInvocation.
	self shouldNotBeATypeError: error.