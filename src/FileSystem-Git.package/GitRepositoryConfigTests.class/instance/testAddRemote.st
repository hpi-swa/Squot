testing
testAddRemote
	| remote |
	"given"
	remote := GitRemote name: 'origin' url: 'http://example.com/git/example.git'.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	"when"
	repository addRemote: remote.
	"then"
	self assert: 'http://example.com/git/example.git' equals: (repository remoteConfigFor: 'origin' option: 'url');
		assert: '+refs/heads/*:refs/remotes/origin/*' equals: (repository remoteConfigFor: 'origin' option: 'fetch').