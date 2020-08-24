running
tearDown
	basicRepository withUnitOfWork: [GitFSCK validate: basicRepository].
	super tearDown.