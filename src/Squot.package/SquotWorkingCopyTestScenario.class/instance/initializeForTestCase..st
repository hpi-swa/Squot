initialize-release
initializeForTestCase: aWorkingCopyTestCase
	testCase := aWorkingCopyTestCase.
	workingCopy := aWorkingCopyTestCase workingCopy.
	repository := workingCopy repository.
	store := workingCopy store.