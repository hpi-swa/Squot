running
setUp
	super setUp.
	self assert: basicRepository notNil. "see createSomeCommits"
	repository := basicRepository newUnitOfWork.