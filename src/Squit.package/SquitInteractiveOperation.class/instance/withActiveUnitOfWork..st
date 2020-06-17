private
withActiveUnitOfWork: aBlock
	wasUnitOfWorkStarted ifFalse: [unitOfWork start. wasUnitOfWorkStarted := true].
	self unitOfWork activateDuring: aBlock.