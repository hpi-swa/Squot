tests
testDiffWithParent
	| sampleClass packageInfo anotherClass latestVersion patch |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := self addPackage.
	
	repository withUnitOfWork:
	[workingCopy saveVersionWithMessage: 'first version'.
	
	self suppressChangeNotificationsDuring: [anotherClass := classFactory newClass].
	anotherClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	
	workingCopy saveVersionWithMessage: 'second version'.
	latestVersion := workingCopy baseVersion.
	patch := (latestVersion patchRelativeToBase: latestVersion parents first).
	self assert: patch hasChanges].