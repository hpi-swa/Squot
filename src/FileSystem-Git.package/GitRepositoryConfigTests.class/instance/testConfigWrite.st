as yet unclassified
testConfigWrite
	(repository baseDir / 'config') ensureDeleted.
	repository configAt: 'remote.origin.url' put: 'http://localhost/git/FileSystem-Git.git'.
	self assert: '[remote "origin"]
url=http://localhost/git/FileSystem-Git.git' equals: (repository baseDir / 'config' readStreamDo: [:stream | stream ascii; contents]) withBlanksTrimmed.