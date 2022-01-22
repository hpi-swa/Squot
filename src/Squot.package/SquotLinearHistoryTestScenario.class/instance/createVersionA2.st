running
createVersionA2
	sampleClass compileSilently: 'a ^ 2'.
	workingCopy newSaveOperation
		message: 'change #a';
		timestamp: DateAndTime now - 3 minutes;
		applyToWorkingCopy.
	versionA2 := workingCopy baseVersion.
	^ versionA2