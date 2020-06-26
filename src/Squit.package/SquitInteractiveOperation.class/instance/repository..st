initialize-release
repository: aSquitRepository
	repository := aSquitRepository.
	unitOfWork ifNil: [self newUnitOfWork].