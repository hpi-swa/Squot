tests
testGetConfigSections
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[core]
	bare = true'].
	self assert: #('core' 'remote') asSet equals: self unitOfWork configSections asSet.