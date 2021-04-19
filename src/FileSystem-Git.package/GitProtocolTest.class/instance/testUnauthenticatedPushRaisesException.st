tests
testUnauthenticatedPushRaisesException
	<timeout: 10 "seconds">
	| testRepo fullRefName protocol |
	testRepo := GitRepositoryFixture new.
	fullRefName := testRepo createNewRandomBranch.
	"push that branch to the test repository, without credentials"
	[protocol := self newProtocol.
	self
		should: [protocol pushReferences: {fullRefName -> testRepo workingCopy revision}
				of: testRepo basicRepository
				deleting: Array empty]
		raise: GitRemoteAuthenticationFailed]
	on: NeedGitCredentials do: [:e | e resume: nil].