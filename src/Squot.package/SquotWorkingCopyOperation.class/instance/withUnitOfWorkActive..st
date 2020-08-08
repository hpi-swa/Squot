applying
withUnitOfWorkActive: aBlock
	"Activate unit of work in the dynamic environment while evaluating the block."
	unitOfWork ifNil: [self createNewUnitOfWork].
	^ unitOfWork activateDuring: aBlock