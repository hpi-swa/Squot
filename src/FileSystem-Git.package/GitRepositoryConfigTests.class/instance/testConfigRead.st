tests
testConfigRead
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[core]
	bare = true'].
	self assert: 'http://localhost/git/FileSystem-Git.git' equals: (self unitOfWork configAt: 'remote.origin.url').
	self assert: '+refs/heads/*:refs/remotes/testserver/*' equals: (self unitOfWork configAt: 'remote.origin.fetch').
	self assert: 'true' equals: (self unitOfWork configAt: 'core.bare').