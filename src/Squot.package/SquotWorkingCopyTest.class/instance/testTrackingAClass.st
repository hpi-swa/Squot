tests
testTrackingAClass
	| class versionBeforeSave latestVersion artifactId path |
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
	class compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	repository withUnitOfWork:
	[path := 'src/', class category, '.package/', class name, '.class'.
	artifactId := (workingCopy add: class at: path) id.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: versionBeforeSave isNil description: 'starting from empty history'.
	
	workingCopy saveVersionWithMessage: 'first version'.
	self denyChangesInWorkingCopy.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: latestVersion parents isEmpty description: 'ancestry'.
	self assert: latestVersion
		equals: workingCopy loadedHistorian version
		description: 'loaded historian'.
	self assertVersion: latestVersion containsClass: class.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.
	self assert: artifactId equals: (latestVersion artifactAt: path) id.
	
	class compileSilently: 'addedMethod ^ self' classified: 'methods of second version'.
	versionBeforeSave := workingCopy loadedHistorian version.
	self assert: latestVersion equals: versionBeforeSave.
	
	workingCopy saveVersionWithMessage: 'second version'.
	self denyChangesInWorkingCopy.
	latestVersion := workingCopy baseVersion.
	self assert: versionBeforeSave ~= latestVersion description: 'new version'.
	self assert: (latestVersion parents includes: versionBeforeSave) description: 'ancestry'.
	self assert: latestVersion
		equals: workingCopy loadedHistorian version
		description: 'loaded historian'.
	self assertVersion: latestVersion containsMethod: class >> #addedMethod.
	self assertVersion: latestVersion containsMethod: class >> #firstMethod.
	self assert: artifactId equals: (latestVersion artifactAt: path) id].