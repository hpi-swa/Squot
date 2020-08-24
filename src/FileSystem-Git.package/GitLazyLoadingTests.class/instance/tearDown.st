running
tearDown
	repository repository withUnitOfWork: [GitFSCK validate: repository repository].
	super tearDown.