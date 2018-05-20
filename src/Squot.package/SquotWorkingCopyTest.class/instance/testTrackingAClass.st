tests
testTrackingAClass
	| class versionBeforeSave latestVersion |
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
	class compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	[workingCopy add: class at: 'src/', class category, '.package/', class name, '.class']
		on: SquotClassWithoutPackageException
		do: [:e | e resume: (PackageInfo named: classFactory packageName)].
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: versionBeforeSave isNil description: 'starting from empty history'.
	
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: latestVersion parents isEmpty description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'stable version'.
	self assertVersion: latestVersion containsClass: class.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.
	
	class compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'stable version'.
	self assertVersion: latestVersion containsMethod: class >> #addedMethod.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.