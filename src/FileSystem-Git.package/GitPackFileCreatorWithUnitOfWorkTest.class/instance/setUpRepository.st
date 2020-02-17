running
setUpRepository
	super setUpRepository.
	basicRepository := repository.
	repository := basicRepository newUnitOfWork.
	