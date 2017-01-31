tests
testPush
	<timeout: 20>
	"when"
	| remoteRefs |
	repository addRemote: 'test' url: self remoteUrl.
	repository push: { 'branch1' } toRemote: 'test'.
	"then"
	remoteRefs := (GitAbstractProtocol url: self remoteUrl) refs.
	self assert: (remoteRefs includesKey: 'refs/heads/branch1').
	self assert: (repository branchNamed: 'branch1') revision hexHash
		equals: (remoteRefs at: 'refs/heads/branch1').
	"when"
	repository push: { 'master' -> 'branch2' } toRemote: 'test'.
	"then"
	remoteRefs := (GitAbstractProtocol url: self remoteUrl) refs.
	self assert: (remoteRefs includesKey: 'refs/heads/branch1').
	self assert: (remoteRefs includesKey: 'refs/heads/branch2').
	self assert: (repository branchNamed: 'branch1') revision hexHash
		equals: (remoteRefs at: 'refs/heads/branch1').
	self assert: (repository branchNamed: 'master') revision hexHash
		equals: (remoteRefs at: 'refs/heads/branch2').
	"when"
	repository pushToRemote: 'test' deleteRemoteBranches: { 'branch1'. 'branch2' }.
	"then"
	remoteRefs := (GitAbstractProtocol url: self remoteUrl) refs.
	self deny: (remoteRefs includesKey: 'refs/heads/branch1').
	self deny: (remoteRefs includesKey: 'refs/heads/branch2').