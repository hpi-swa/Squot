tests
testDiffWithParent
	| sampleClass packageInfo anotherClass latestVersion patch |
	SystemChangeNotifier uniqueInstance doSilently:
		[sampleClass := classFactory newClass.
		sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'].
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src'.
	
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	
	anotherClass := classFactory newClass.
	anotherClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	patch := (latestVersion patchRelativeToBase: latestVersion parents first).
	self assert: patch hasChanges.