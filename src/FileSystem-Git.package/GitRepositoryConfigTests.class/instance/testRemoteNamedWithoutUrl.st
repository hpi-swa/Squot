testing
testRemoteNamedWithoutUrl
	| remote |
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	fetch = +refs/heads/*:refs/remotes/testserver/*
'].
	remote := repository remoteNamed: 'origin'.
	self assert: 'origin' equals: remote name;
		assert: remote url isNil.