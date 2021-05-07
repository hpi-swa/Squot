setUp
setUp
	repository withUnitOfWork:
		[self createFirstVersion;
			createSecondVersion;
			createThirdVersion].