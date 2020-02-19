running
setUp
	super setUp.
	repository := repository newUnitOfWork.
	emptyBlob repository: repository.
	simpleTree repository: repository.