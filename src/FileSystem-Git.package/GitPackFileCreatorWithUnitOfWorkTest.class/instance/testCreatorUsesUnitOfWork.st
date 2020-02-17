running
testCreatorUsesUnitOfWork
	self assert: (creator repository isMemberOf: GitUnitOfWork).