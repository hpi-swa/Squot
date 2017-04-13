as yet unclassified
testUnset
	(repository baseDir / 'config') ensureDeleted.
	(repository baseDir / 'config') writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*
[remote "origin.bla"]
	foo = bar
[core]
	bare = true'].
	repository configUnsetAt: 'remote.origin.fetch'.
	self assert: ('[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
[remote "origin.bla"]
	foo = bar
[core]
	bare = true
' withLineEndings: String lf) equals: (repository baseDir / 'config' readStreamDo: [:s | s contents]).
	repository configUnsetAt: 'remote.origin.bla.foo'.
	self assert: ('[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
[remote "origin.bla"]
[core]
	bare = true
' withLineEndings: String lf) equals: (repository baseDir / 'config' readStreamDo: [:s | s contents]).
	repository configUnsetAt: 'remote.origin'.
	self assert: ('[core]
	bare = true
' withLineEndings: String lf) equals: (repository baseDir / 'config' readStreamDo: [:s | s contents]).