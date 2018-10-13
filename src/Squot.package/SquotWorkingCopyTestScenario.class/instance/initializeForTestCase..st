initialize-release
initializeForTestCase: aWorkingCopyTestCase
	testCase := aWorkingCopyTestCase.
	classFactory := aWorkingCopyTestCase classFactory.
	workingCopy := aWorkingCopyTestCase workingCopy.
	repository := workingCopy repository.
	store := workingCopy store.
	self setUp.