tests
testTrackingAPackage
	| sampleClass packageInfo anotherClass versionBeforeSave latestVersion |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	repository withUnitOfWork:
	[packageInfo := self addPackage.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: versionBeforeSave isNil description: 'starting from an empty history'.
	
	workingCopy saveVersionWithMessage: 'first version'.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents isEmpty) description: 'ancestry'.
	self assert: latestVersion
		equals: workingCopy loadedHistorian version
		description: 'stable version'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: sampleClass.
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod.
	
	self suppressChangeNotificationsDuring:
		[anotherClass := classFactory newClassInCategory: sampleClass category].
	anotherClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveVersionWithMessage: 'second version'.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: latestVersion
		equals: workingCopy loadedHistorian version
		description: 'stable version'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: anotherClass.
	self assertVersion: latestVersion containsMethod: anotherClass >> #addedMethod.
	self assertVersion: latestVersion containsClass: sampleClass.
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod].