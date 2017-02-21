tests
testReadingNonBareRepository
	| repositoryEntries |
	self createSomeCommits.
	
	self deny: fsRepository head root children isEmpty.
	self assert: fsRepository head root children size = 2.
	
	self assert: reference children size = 1.
	self assert: reference children first basename = '.git'.
	
	repositoryEntries := #(
		'HEAD'
		'objects'
		'info'
		'refs').
	self assert: ((reference children first children collect: [ :each | each basename ]) includesAllOf: repositoryEntries)