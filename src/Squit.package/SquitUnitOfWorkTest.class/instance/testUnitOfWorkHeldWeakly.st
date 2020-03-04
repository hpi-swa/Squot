tests
testUnitOfWorkHeldWeakly
	| uow weakHolder |
	uow := squitRepository unitOfWork.
	weakHolder := WeakArray with: uow.
	uow := nil.
	self retryWithGC: [weakHolder first isNil] until: [:result | result == true].
	self assert: weakHolder first isNil.