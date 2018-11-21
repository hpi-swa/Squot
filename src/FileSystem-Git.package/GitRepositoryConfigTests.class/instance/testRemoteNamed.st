testing
testRemoteNamed
	| remote |
	(repository baseDir / 'config') ensureDeleted.
	(repository baseDir / 'config') writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*
'].
	remote := repository remoteNamed: 'origin'.
	self assert: 'origin' equals: remote name;
		assert: 'http://localhost/git/FileSystem-Git.git' equals: remote url asString;
		assert: remote fetchSpecs size == 1;
		assert: (GitFetchSpec fromString: '+refs/heads/*:refs/remotes/testserver/*' forRemote: remote) equals: remote fetchSpecs anyOne.