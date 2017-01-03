tests
testPushCreateUpdateDelete
	<timeout: 20>
	| remoteRefs master |
	"given"
	repository addRemote: 'test' url: self remoteUrl.
	"when"
	repository push: { 'branch1' -> 'test/branch1'. 'master' -> 'test/branch2' } toRemote: 'test'.
	repository createBranchNamed: 'oldmaster' at: (repository branchNamed: 'master') revision.
	master := repository branchNamed: 'master'.
	master / 'README.md' writeStreamDo: [:stream | stream nextPutAll: 'updated text'; cr].
	master commit: 'testPushCreateUpdateDelete commit'.
	repository pushToRemote: 'test' update: { 'master' -> 'test/branch2'. 'oldmaster' -> 'test/oldmaster' } deleteRemoteBranches: { 'test/branch1' }.
	"then"
	remoteRefs := (GitAbstractProtocol url: self remoteUrl) refs.
	self deny: (remoteRefs includesKey: 'refs/heads/test/branch1').
	self assert: (repository branchNamed: 'master') revision hexHash
		equals: (remoteRefs at: 'refs/heads/test/branch2').
	self assert: (repository branchNamed: 'oldmaster') revision hexHash
		equals: (remoteRefs at: 'refs/heads/test/oldmaster').
	"finally"
	repository pushToRemote: 'test' deleteRemoteBranches: { 'test/branch2'. 'test/oldmaster' }.