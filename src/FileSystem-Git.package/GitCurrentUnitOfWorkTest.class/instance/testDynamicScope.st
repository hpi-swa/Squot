tests
testDynamicScope
	| repository uow |
	uow := Object new.
	repository := GitRepository memory.
	GitCurrentUnitOfWork value: uow for: repository during:
		[self assert: uow == (GitCurrentUnitOfWork forRepository: repository)].
	self deny: uow == (GitCurrentUnitOfWork forRepository: repository).