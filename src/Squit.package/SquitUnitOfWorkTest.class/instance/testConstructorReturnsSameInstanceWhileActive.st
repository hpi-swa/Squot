tests
testConstructorReturnsSameInstanceWhileActive
	| uow |
	uow := squitRepository unitOfWork.
	uow activateDuring:
		[self assert: uow == squitRepository unitOfWork].
	self deny: uow == squitRepository unitOfWork.