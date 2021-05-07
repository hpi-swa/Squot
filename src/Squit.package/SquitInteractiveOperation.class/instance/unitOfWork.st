accessing
unitOfWork
	^ unitOfWork ifNil: [self newUnitOfWork]