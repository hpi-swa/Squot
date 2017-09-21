tests
testTrackingAPackage
	| sampleClass packageInfo anotherClass versionBeforeSave latestVersion |
	SystemChangeNotifier uniqueInstance doSilently:
		[sampleClass := classFactory newClass.
		sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'].
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src/', packageInfo packageName, '.package'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: versionBeforeSave isNil description: 'starting from an empty history'.
	
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents isEmpty) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'stable version'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: sampleClass.
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod.
	
	anotherClass := classFactory newClassInCategory: sampleClass category.
	anotherClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'stable version'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: anotherClass.
	self assertVersion: latestVersion containsMethod: anotherClass >> #addedMethod.
	self assertVersion: latestVersion containsClass: sampleClass.
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod.