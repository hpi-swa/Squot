running
setUp
	super setUp.
	repository := repository newUnitOfWork.
	fakeTree repository: repository.