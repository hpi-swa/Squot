tests
testReadingNonBareRepository
	| ref repositoryEntries |
	ref := FSFilesystem memory / 'repo'.
	fsRepository := FileSystemGitRepository on: ref.
	workingCopy := fsRepository head.
	self createSomeCommits.
	
	self deny: fsRepository head root children isEmpty.
	self assert: fsRepository head root children size = 2.
	
	self assert: ref children size = 1.
	self assert: ref children first basename = '.git'.
	
	repositoryEntries := #(
		'HEAD'
		'objects'
		'info'
		'refs').
	self assert: ((ref children first children collect: [ :each | each basename ]) includesAllOf: repositoryEntries)