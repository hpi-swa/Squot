tests
testConstructorReturnsSameInstanceWhileActive
	| uow |
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ self "test not applicable"].
	
	uow := squitRepository unitOfWork.
	uow activateDuring:
		[self assert: uow == squitRepository unitOfWork].
	self deny: uow == squitRepository unitOfWork.