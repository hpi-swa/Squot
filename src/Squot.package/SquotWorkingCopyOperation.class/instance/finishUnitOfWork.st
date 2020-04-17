applying
finishUnitOfWork
	SquotToggles useUnitOfWorkInterface ifFalse: [^ self].
	unitOfWork finish.