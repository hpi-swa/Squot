tests
testGitPackFileRepositoriesAreNotUnitsOfWork
	GitPackFile allSubInstancesDo: [:each | self assert: each repository class ~= GitUnitOfWork].