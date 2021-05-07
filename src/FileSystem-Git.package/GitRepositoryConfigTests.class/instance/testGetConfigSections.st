tests
testGetConfigSections
	"This operation is not supported on unit of work.
	What's the point of retrieving the sections?"
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[core]
	bare = true'].
	"self assert: #('core' 'remote') asSet equals: self unitOfWork configSections asSet."