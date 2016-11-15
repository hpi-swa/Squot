commit tests
testTagging
	| ref |
	(workingCopy / 'afile') ensureFile.
	self commit: 'a commit' andTag: 'my first tag'.
	ref := basicRepository tagsDir / 'my first tag'.
	
	self assert: ref exists.
	self assert: ref basename equals: 'my first tag'.
	self 
		assert: (basicRepository objectNamed: ref readStream contents asString withBlanksTrimmed) message 
		equals: 'a commit'