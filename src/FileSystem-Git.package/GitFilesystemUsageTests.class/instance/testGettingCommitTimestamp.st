tests
testGettingCommitTimestamp
	| commitStamp authorStamp path repository fs |
	path := FileSystem memory / 'repo.git'.
	self createFixedTimeStampCommitIn: path.
	repository := FileSystemGitRepository on: path.
	repository withUnitOfWork: [
	fs := repository head.
	
	commitStamp := fs timeStampOfCommit.
	self assert: DateAndTime equals: commitStamp species.
	self 
		assert: (DateAndTime year: 2011 month: 06 day: 28 hour: 22 minute: 10) asTimeStamp 
		equals: commitStamp.
		
	authorStamp := fs timeStampOfCreation.
	self assert: DateAndTime equals: authorStamp species.
	self 
		assert: (DateAndTime year: 2010 month: 06 day: 27 hour: 21 minute: 11) asTimeStamp 
		equals: authorStamp
	].