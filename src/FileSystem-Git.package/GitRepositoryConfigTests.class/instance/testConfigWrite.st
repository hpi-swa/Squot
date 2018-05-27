testing
testConfigWrite
	(repository baseDir / 'config') ensureDeleted.
	repository configAt: 'remote.origin.url' put: 'http://localhost/git/FileSystem-Git.git'.
	self assert: '[remote "origin"]
url=http://localhost/git/FileSystem-Git.git' equals: self configFileContents.