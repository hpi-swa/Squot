applying
startUnitOfWork
	SquotToggles useUnitOfWorkInterface ifFalse: [^ self].
	unitOfWork start.