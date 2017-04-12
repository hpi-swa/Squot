as yet unclassified
testGetConfigSectionSubkeys
	(repository baseDir / 'config') ensureDeleted.
	(repository baseDir / 'config') writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*
[remote "origin.bla"]
	foo = bar
[core]
	bare = true'].
	self assert: #('origin') equals: (repository configSubkeysAt: 'remote' ifAbsent: [#()]).
	self assert: #('bare') equals: (repository configSubkeysAt: 'core' ifAbsent: [#()]).
	self assert: #('bla' 'url' 'fetch') asSet equals: (repository configSubkeysAt: 'remote.origin' ifAbsent: [#()]) asSet.