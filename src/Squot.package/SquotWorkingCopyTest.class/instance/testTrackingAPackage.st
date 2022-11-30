tests
testTrackingAPackage
	| sampleClass packageInfo anotherClass versionBeforeSave latestVersion artifactId path |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	repository withUnitOfWork:
	[packageInfo := self addPackage.
	path := workingCopy artifacts anyOne path.
	artifactId := (workingCopy artifactAt: path) id.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: versionBeforeSave isNil description: 'starting from an empty history'.
	
	workingCopy saveVersionWithMessage: 'first version'.
	self denyChangesInWorkingCopy.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents isEmpty) description: 'ancestry'.
	self assert: latestVersion
		equals: workingCopy loadedHistorian version
		description: 'stable version'.
	self assertVersion: latestVersion containsPackage: packageInfo.
	self assertVersion: latestVersion containsClass: sampleClass.
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod.
	self assert: artifactId equals: (workingCopy artifactAt: path) id.
	
	self suppressChangeNotificationsDuring:
		[anotherClass := classFactory newClassInCategory: sampleClass category].
	anotherClass compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveVersionWithMessage: 'second version'.
	self denyChangesInWorkingCopy.
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
	self assertVersion: latestVersion containsMethod: sampleClass >> #firstMethod.
	self assert: artifactId equals: (workingCopy artifactAt: path) id].