tests
testTrackingAClass
	| class versionBeforeSave latestVersion |
	class := classFactory newClass.
	class compile: 'firstMethod ^ self' classified: 'methods of first version'.
	workingCopy add: class at: 'src'.
	versionBeforeSave := workingCopy loadedHistorian version.
	
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'updated historian'.
	self assertVersion: latestVersion containsClass: class.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.
	
	class compile: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	latestVersion := workingCopy loadedHistorian version.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: workingCopy loadedHistorian version == latestVersion description: 'updated historian'.
	self assertVersion: latestVersion containsMethod: class >> #addedMethod.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.