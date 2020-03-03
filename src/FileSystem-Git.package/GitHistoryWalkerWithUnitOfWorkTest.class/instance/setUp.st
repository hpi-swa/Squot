running
setUp
	super setUp.
	self assert: basicRepository notNil. "see createSomeObjects"
	repository := basicRepository newUnitOfWork.
	emptyBlob repository: repository.
	simpleTree repository: repository.