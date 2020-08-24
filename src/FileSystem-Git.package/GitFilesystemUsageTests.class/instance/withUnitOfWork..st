helpers
withUnitOfWork: aBlock
	^ fsRepository withUnitOfWork: [aBlock value: fsRepository unitOfWork]