tests
testTrackingAPackage
	| sampleClass packageInfo anotherClass versionBeforeSave latestVersion |
	sampleClass := classFactory newClass.
	sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := sampleClass package.
	workingCopy add: packageInfo at: 'src'.
	versionBeforeSave := workingCopy loadedHistorian version.
	
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	latestVersion := workingCopy loadedHistorian version.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'updated historian'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: sampleClass.
	
	anotherClass := classFactory newClassInCategory: sampleClass category.
	anotherClass compile: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'updated historian'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: anotherClass.
	self assertVersion: latestVersion containsClass: sampleClass.