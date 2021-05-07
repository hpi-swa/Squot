tests
testAddRemote
	| remote |
	"given"
	remote := GitRemote name: 'origin' url: 'http://example.com/git/example.git'.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	"when"
	self unitOfWork addRemote: remote.
	"then"
	self assert: 'http://example.com/git/example.git' equals: (self unitOfWork remoteConfigFor: 'origin' option: 'url');
		assert: '+refs/heads/*:refs/remotes/origin/*' equals: (self unitOfWork remoteConfigFor: 'origin' option: 'fetch').