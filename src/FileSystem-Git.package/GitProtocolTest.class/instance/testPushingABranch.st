tests
testPushingABranch
	<timeout: 10 "seconds">
	| testRepo  fullRefName protocol |
	testRepo := GitRepositoryFixture new.
	fullRefName := testRepo createNewRandomBranch.
	protocol := self newProtocol.
	protocol pushReferences: {fullRefName -> testRepo workingCopy revision} of: testRepo basicRepository deleting: Array empty.
	"TODO: assert a positive response"
	"initiate a fetch of the new branch"
	protocol loadRefs.
	"assert that the branch exists and the object id is the same"
	self assert: (protocol refs includesKey: fullRefName).
	"remove the branch (tearDown)"
	protocol pushReferences: Array empty of: testRepo basicRepository deleting:  {fullRefName}.
	protocol loadRefs.
	self deny: (protocol refs includesKey: fullRefName).