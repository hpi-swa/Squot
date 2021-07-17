as yet unclassified
clone
	self requestProjectName ifNil: [^ nil].
	self requestUrl ifNil: [^ nil].
	self createRepository ifNil: [^ nil].
	repository withUnitOfWork:
		[self fetchAndSetUp ifNil: [^ nil]].
	self registerWorkingCopy ifNil: [^ nil].