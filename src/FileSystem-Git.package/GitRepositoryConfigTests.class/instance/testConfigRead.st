testing
testConfigRead
	(repository baseDir / 'config') ensureDeleted.
	self assert: (repository configAt: 'remote.origin.url' ifAbsent: [42]) = 42.
	(repository baseDir / 'config') writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[core]
	bare = true'].
	self assert: 'http://localhost/git/FileSystem-Git.git' equals: (repository configAt: 'remote.origin.url').
	self assert: '+refs/heads/*:refs/remotes/testserver/*' equals: (repository configAt: 'remote.origin.fetch').
	self assert: 'true' equals: (repository configAt: 'core.bare').