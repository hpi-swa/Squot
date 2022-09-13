running
createVersionA1
	sampleClass compileSilently: 'a ^ 1'.
	workingCopy newSaveOperation
		message: 'introduce #a';
		timestamp: DateAndTime now - 5 minutes;
		applyToWorkingCopy.
	versionA1 := workingCopy baseVersion.
	^ versionA1