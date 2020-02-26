scope activation
activateDuring: aBlock
	^ GitCurrentUnitOfWork
		value: gitUnitOfWork
		for: repository gitRepository repository
		during: aBlock