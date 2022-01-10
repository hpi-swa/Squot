running
clone

	self requestUrl ifNil: [^ nil].
	name := (remoteUrl splitBy: '/') last copyReplaceAll: '.git' with: ''.
	
	self createRepository ifNil: [^ nil].
	repository withUnitOfWork: [self fetchAndSetUp ifNil: [^ nil]].
	self registerWorkingCopy ifNil: [^ nil]