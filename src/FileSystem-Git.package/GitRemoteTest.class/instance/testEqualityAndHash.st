testing
testEqualityAndHash
	self assert: (GitRemote name: 'a' url: 'http://example.com/git/example.git')
		equals: (GitRemote name: 'a' url: 'http://example.com/git/example.git').
	self assert: (GitRemote name: 'a' url: 'http://example.com/git/example.git') hash
		equals: (GitRemote name: 'a' url: 'http://example.com/git/example.git') hash.
	self assert: ((GitRemote name: 'a' url: 'http://example.com/git/example.git') repository: 1; yourself)
		equals: ((GitRemote name: 'a' url: 'http://example.com/git/example.git') repository: 2; yourself).
	self assert: ((GitRemote name: 'a' url: 'http://example.com/git/example.git') repository: 1; yourself) hash
		equals: ((GitRemote name: 'a' url: 'http://example.com/git/example.git') repository: 2; yourself) hash.
	self deny: (GitRemote name: 'a' url: 'http://example.com/git/different.git')
		= (GitRemote name: 'a' url: 'http://example.com/git/example.git').
	self deny: (GitRemote name: 'different' url: 'http://example.com/git/example.git')
		= (GitRemote name: 'a' url: 'http://example.com/git/example.git').