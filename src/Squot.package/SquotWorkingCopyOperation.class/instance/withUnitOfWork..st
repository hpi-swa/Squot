applying
withUnitOfWork: aBlock
	"Activate unit of work in the dynamic environment while evaluating the block.
	Finish the unit of work after the block has been evaluated."
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	^ [self withUnitOfWorkActive:
		[self startUnitOfWork.
		aBlock value]]
		ensure: [self finishUnitOfWork]