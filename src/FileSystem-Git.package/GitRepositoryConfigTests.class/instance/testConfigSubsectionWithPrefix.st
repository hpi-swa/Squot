testing
testConfigSubsectionWithPrefix
	| remoteSubset |
	configFile writeStreamDo: [:stream | stream nextPutAll: 
'[remote "origin"]
	url = http://localhost/git/FileSystem-Git.git
	fetch = +refs/heads/*:refs/remotes/testserver/*

[remote "backup"]
	url = ssh:user@git-backup-host:/git/FileSystem-Git.git
	fetch = +refs/heads/master:refs/remotes/backup/master
	fetch = +refs/heads/develop:refs/remotes/backup/develop

[a "b.c"]
	d = true
[a "bx"]
	should not be found = by prefix a.b

[core]
	bare = true
[corex]
	should not be found = by prefix core'].
	self assert: {} equals: (repository configSubsetWithPrefix: 'doesnotexist').
	self assert: {'core.bare' -> 'true'} equals: (repository configSubsetWithPrefix: 'core').
	self assert: {'remote.origin.url' -> 'http://localhost/git/FileSystem-Git.git'.
				'remote.origin.fetch' -> '+refs/heads/*:refs/remotes/testserver/*'} asSet
		equals: (repository configSubsetWithPrefix: 'remote.origin') asSet.
	self assert: {'a.b.c.d' -> 'true'} equals: (repository configSubsetWithPrefix: 'a.b').
	remoteSubset := repository configSubsetWithPrefix: 'remote'.
	self assert: (remoteSubset anySatisfy: [:each | each key = 'remote.origin.url']).
	self assert: (remoteSubset anySatisfy: [:each | each key = 'remote.origin.fetch']).
	self assert: (remoteSubset anySatisfy: [:each | each key = 'remote.backup.url']).
	"self assert: 2 equals: (remoteSubset count: [:each | each key = 'remote.backup.fetch'])."