running
setUpRepository
	super setUpRepository.
	self assert: repository unitOfWork == repository. "converted by createSomeBlobs"