ui
withUnitOfWork: aBlock
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	self projectSelection repository unitOfWork activateDuring: aBlock.