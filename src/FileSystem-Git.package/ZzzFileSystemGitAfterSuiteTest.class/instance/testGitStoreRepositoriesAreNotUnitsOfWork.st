tests
testGitStoreRepositoriesAreNotUnitsOfWork
	GitStore allSubInstancesDo: [:each | self assert: (each instVarNamed: 'repository') class ~= GitUnitOfWork].