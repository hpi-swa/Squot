running
tearDown
	shouldValidateRepos
		ifFalse: [ GitFSCK validate: basicRepository ].
	super tearDown.