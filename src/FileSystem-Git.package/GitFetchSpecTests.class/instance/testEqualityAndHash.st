testing
testEqualityAndHash
	| otherRemote remote |
	remote := 'dummy'.
	otherRemote := 'dummy2'.
	self assert: (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: remote)
		equalsAndHasSameHashAs: (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: remote).
	self deny: (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/different/*' forRemote: remote)
		= (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: remote).
	self deny: (GitFetchSpec fromString: '+refs/custom/*:refs/remotes/origin/*' forRemote: remote)
		= (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: remote).
	self deny: (GitFetchSpec fromString: 'refs/heads/*:refs/remotes/origin/*' forRemote: remote)
		= (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: remote).
	self deny: (GitFetchSpec fromString: '+refs/custom/*:refs/remotes/origin/*' forRemote: remote)
		= (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/origin/*' forRemote: otherRemote).