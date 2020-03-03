running
setUp
	super setUp.
	self assert: basicRepository notNil. "see setUpRepositoryObjects"
	repository := basicRepository newUnitOfWork.