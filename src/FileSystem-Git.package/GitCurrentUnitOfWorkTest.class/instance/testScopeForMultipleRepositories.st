tests
testScopeForMultipleRepositories
	| repository1 repository2 uow1 uow2 |
	uow1 := Object new. uow2 := Object new.
	repository1 := GitRepository memory. repository2 := GitRepository memory.
	GitCurrentUnitOfWork value: uow1 for: repository1 during:
		[GitCurrentUnitOfWork value: uow2 for: repository2 during:
			[self assert: uow1 == (GitCurrentUnitOfWork forRepository: repository1).
			self assert: uow2 == (GitCurrentUnitOfWork forRepository: repository2)].
		self assert: uow1 == (GitCurrentUnitOfWork forRepository: repository1).
		self deny: uow2 == (GitCurrentUnitOfWork forRepository: repository2)].