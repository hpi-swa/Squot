tests
testRestorePackage
	| sampleClass sampleClassName firstMethod packageInfo anotherClass anotherClassName addedMethod firstVersion latestVersion artifactId path |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	sampleClassName := sampleClass name. "when unloaded, the class is renamed"
	firstMethod := sampleClass >> #firstMethod.
	repository withUnitOfWork:
	[packageInfo := self addPackage.
	path := workingCopy artifacts anyOne path.
	artifactId := (workingCopy artifactAt: path) id.
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.
	self suppressChangeNotificationsDuring:
		[anotherClass := classFactory newClassInCategory: sampleClass category].
	sampleClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	anotherClassName := anotherClass name. "when unloaded, the class is renamed"
	addedMethod := sampleClass >> #addedMethod.
	workingCopy saveVersionWithMessage: 'second version'.
	latestVersion := workingCopy baseVersion.
	
	self suppressChangeNotificationsDuring:
		[workingCopy loadVersion: firstVersion interactive: false].
	self deny: (packageInfo includesClassNamed: anotherClassName) description: 'unregister new class'.
	self assert: anotherClass isObsolete description: 'unloaded new class'.
	self assert: (packageInfo includesClass: sampleClass) description: 'keep first class'.
	self deny: sampleClass isObsolete.
	self assert: firstMethod isInstalled description: 'keep firstMethod'.
	self deny: addedMethod isInstalled description: 'remove addedMethod'.
	self assert: artifactId equals: (workingCopy artifactAt: path) id.
	
	self suppressChangeNotificationsDuring:
		[workingCopy loadVersion: latestVersion interactive: false].
	self assert: (packageInfo includesClassNamed: anotherClassName) description: 'restore new class'.
	self assert: ((anotherClass := store environment at: anotherClassName) isKindOf: Class).
	self deny: anotherClass isObsolete.
	self assert: addedMethod getSource asString
		equals: (sampleClass >> addedMethod selector) getSource asString
		description: 'restore addedMethod'].
	self assert: artifactId equals: (workingCopy artifactAt: path) id.