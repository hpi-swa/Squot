tests
testReadingBareRepository
	|  repositoryEntries |
	self createSomeCommits.
	
	self deny: fsRepository head root children isEmpty.
	self assert: fsRepository head root children size = 2.
	
	repositoryEntries := #(
		'HEAD'
		'objects'
		'info'
		'refs').
	self assert: ((reference / '.git') childNames includesAllOf: repositoryEntries)