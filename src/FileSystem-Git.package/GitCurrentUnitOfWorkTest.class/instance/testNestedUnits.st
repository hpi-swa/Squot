tests
testNestedUnits
	| uow1 uow2 repository |
	repository := GitRepository memory.
	uow1 := repository newUnitOfWork.
	GitCurrentUnitOfWork value: uow1 for: repository during:
		[uow2 := repository newUnitOfWork.
		GitCurrentUnitOfWork value: uow2 for: repository during:
			[self assert: uow2 == (GitCurrentUnitOfWork forRepository: repository)].
		self assert: uow1 == (GitCurrentUnitOfWork forRepository: repository)].
	self deny: uow1 == (GitCurrentUnitOfWork forRepository: repository);
		deny: uow2 == (GitCurrentUnitOfWork forRepository: repository).