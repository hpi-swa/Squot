setUp
createSecondVersion
	sampleClass compileSilently: 'secondMethod ^ self'
		classified: 'methods of second version'.
	secondMethod := sampleClass >> #secondMethod.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.
	^ secondVersion