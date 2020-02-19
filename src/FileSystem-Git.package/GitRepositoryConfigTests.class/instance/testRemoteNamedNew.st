testing
testRemoteNamedNew
	| remote |
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*
'].
	remote := repository remoteNamed: 'doesnotexist'.
	self assert: 'doesnotexist' equals: remote name;
		assert: remote url isNil;
		assert: remote fetchSpecs isEmpty;
		assert: (repository configSubsetWithPrefix: 'remote.doesnotexist') isEmpty
		description: 'accessing the remote does not create it yet'.