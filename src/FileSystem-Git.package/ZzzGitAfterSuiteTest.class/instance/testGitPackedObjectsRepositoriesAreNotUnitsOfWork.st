tests
testGitPackedObjectsRepositoriesAreNotUnitsOfWork
	GitPackedObject allSubInstancesDo: [:each | self assert: each repository class ~= GitUnitOfWork].