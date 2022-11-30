running
createVersionB
	sampleClass compileSilently: 'b ^ 1'.
	workingCopy newSaveOperation
		message: 'introduce #b';
		timestamp: DateAndTime now - 4 minutes;
		applyToWorkingCopy.
	versionB := workingCopy baseVersion.
	^ versionB