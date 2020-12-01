instance creation
forTestCase: aWorkingCopyTestCase
	^ self basicNew
		initializeForTestCase: aWorkingCopyTestCase;
		setUp;
		yourself