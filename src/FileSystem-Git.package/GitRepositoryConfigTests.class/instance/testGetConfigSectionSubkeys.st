tests
testGetConfigSectionSubkeys
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*
[remote "origin.bla"]
	foo = bar
[core]
	bare = true'].
	self assert: #('origin') equals: (self unitOfWork configSubkeysAt: 'remote').
	self assert: #('bare') equals: (self unitOfWork configSubkeysAt: 'core').
	self assert: #('bla' 'url' 'fetch') asSet equals: (self unitOfWork configSubkeysAt: 'remote.origin') asSet.