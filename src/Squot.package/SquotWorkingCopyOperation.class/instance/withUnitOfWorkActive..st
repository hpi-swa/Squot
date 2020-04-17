applying
withUnitOfWorkActive: aBlock
	"Activate unit of work in the dynamic environment while evaluating the block."
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	unitOfWork ifNil: [self createNewUnitOfWork].
	unitOfWork == workingCopy repository ifTrue: [^ aBlock value].
	^ unitOfWork activateDuring: aBlock