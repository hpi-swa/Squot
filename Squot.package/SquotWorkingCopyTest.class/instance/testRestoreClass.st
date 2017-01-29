tests
testRestoreClass
	| sampleClass firstMethod addedMethod firstVersion latestVersion |
	sampleClass := classFactory newClass.
	sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'.
	firstMethod := sampleClass >> #firstMethod.
	workingCopy add: sampleClass at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.
	sampleClass compile: 'addedMethod ^ self' classified: 'methods of second version'.
	addedMethod := sampleClass >> #addedMethod.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	
	workingCopy loadVersion: firstVersion interactive: false.
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	
	workingCopy loadVersion: latestVersion interactive: false.
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self assert: addedMethod equals: sampleClass >> addedMethod selector description: 'restore addedMethod'.