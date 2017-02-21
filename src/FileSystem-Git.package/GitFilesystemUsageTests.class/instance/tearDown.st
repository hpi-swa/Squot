running
tearDown
	shouldValidateRepos
		ifFalse: [ GitFSCK validate: basicRepository ].