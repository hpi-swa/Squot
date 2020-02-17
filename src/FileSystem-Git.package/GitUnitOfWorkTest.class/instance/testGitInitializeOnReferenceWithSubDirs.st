tests
testGitInitializeOnReferenceWithSubDirs
	reference := FileSystem memory referenceTo: 'alpha/beta/testRepo.git'.
	repository := GitRepository basicNew.
	repository instVarNamed: 'reference' put: reference.
	self 
		shouldnt: [repository gitInitialize]
		raise: DirectoryDoesNotExist
		description: 'The reference of the repository points to a directory'
			, 'inside of a parent directory that does not exist.'
			, 'Create the parent directory first.'