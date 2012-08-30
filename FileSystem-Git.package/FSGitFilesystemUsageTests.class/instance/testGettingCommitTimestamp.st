tests
testGettingCommitTimestamp
	| commitStamp authorStamp repo fs |
	repo := FSFilesystem memory / 'repo.git'.
	self createFixedTimeStampCommitIn: repo.
	fs := (FSGitRepository on: repo) head.
	
	commitStamp := fs timeStampOfCommit.
	self assert: TimeStamp equals: commitStamp species.
	self 
		assert: (DateAndTime year: 2011 month: 06 day: 28 hour: 22 minute: 10) asTimeStamp 
		equals: commitStamp.
		
	authorStamp := fs timeStampOfCreation.
	self assert: TimeStamp equals: authorStamp species.
	self 
		assert: (DateAndTime year: 2010 month: 06 day: 27 hour: 21 minute: 11) asTimeStamp 
		equals: authorStamp