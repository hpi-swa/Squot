instance creation
forTestCase: aWorkingCopyTestCase
	^ self basicNew
		initializeForTestCase: aWorkingCopyTestCase;
		yourself