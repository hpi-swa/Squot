tests
testConfigWrite
	self unitOfWork configAt: 'remote.origin.url' put: 'http://localhost/git/FileSystem-Git.git'.
	self assert: '[remote "origin"]
url=http://localhost/git/FileSystem-Git.git' equals: self configFileContents.