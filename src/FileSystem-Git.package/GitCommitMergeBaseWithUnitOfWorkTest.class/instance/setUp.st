running
setUp
	super setUp.
	self assert: repository unitOfWork == repository. "converted in createFakeTree"