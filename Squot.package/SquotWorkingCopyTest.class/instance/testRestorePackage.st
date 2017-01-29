tests
testRestorePackage
	| sampleClass firstMethod packageInfo anotherClass addedMethod firstVersion latestVersion |
	sampleClass := classFactory newClass.
	sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'.
	firstMethod := sampleClass >> #firstMethod.
	packageInfo := sampleClass package.
	workingCopy add: packageInfo at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.	
	anotherClass := classFactory newClassInCategory: sampleClass category.
	sampleClass compile: 'addedMethod ^ self' classified: 'methods of second version'.
	addedMethod := sampleClass >> #addedMethod.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	
	workingCopy loadVersion: firstVersion interactive: false.
	self deny: (packageInfo includesClass: anotherClass) description: 'unregister new class'.
	self assert: anotherClass isObsolete description: 'unloaded new class'.
	self assert: (packageInfo includesClass: sampleClass) description: 'keep first class'.
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	
	workingCopy loadVersion: latestVersion interactive: false.
	self assert: (packageInfo includesClass: anotherClass) description: 'restore new class'.
	self assert: ((anotherClass := workingCopy environment at: anotherClass name) isKindOf: Class).
	self deny: anotherClass isObsolete.
	self assert: addedMethod equals: sampleClass >> addedMethod selector description: 'restore addedMethod'.