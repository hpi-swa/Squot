setUp
createSecondVersion
	sampleClass compileSilently: 'secondMethod ^ self'
		classified: 'methods of second version'.
	secondMethod := sampleClass >> #secondMethod.
	workingCopy saveVersionWithMessage: 'second version'.
	secondVersion := workingCopy baseVersion.
	^ secondVersion