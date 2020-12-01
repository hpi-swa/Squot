commit tests
testTagging
	| ref |
	(workingCopy / 'afile') ensureFile.
	self commit: 'a commit' andTag: 'myFirstTag'.
	ref := basicRepository tagsDir / 'myFirstTag'.
	
	self assert: ref exists.
	self assert: ref basename equals: 'myFirstTag'.
	self withUnitOfWork: [:git |
	self 
		assert: (git objectNamed: ref readStream contents asString withBlanksTrimmed) message 
		equals: 'a commit'
	].