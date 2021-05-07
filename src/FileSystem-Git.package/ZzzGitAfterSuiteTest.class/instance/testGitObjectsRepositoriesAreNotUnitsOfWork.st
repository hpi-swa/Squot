tests
testGitObjectsRepositoriesAreNotUnitsOfWork
	GitObject allSubInstancesDo: [:each | self assert: each repository class ~= GitUnitOfWork].