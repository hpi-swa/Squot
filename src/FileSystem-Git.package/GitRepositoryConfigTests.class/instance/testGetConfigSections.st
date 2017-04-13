as yet unclassified
testGetConfigSections
	(repository baseDir / 'config') ensureDeleted.
	(repository baseDir / 'config') writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[core]
	bare = true'].
	self assert: #('core' 'remote') asSet equals: repository configSections asSet.