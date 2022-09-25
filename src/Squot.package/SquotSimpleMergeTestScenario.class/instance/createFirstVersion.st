setUp
createFirstVersion
	SystemChangeNotifier uniqueInstance doSilently: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	packagePath := (MCSnapshot empty asSquotArtifactForPackage: packageInfo) path.
	workingCopy add: packageInfo at: packagePath.
	SquotToggles useNewApi
		ifTrue: [packageId := (workingCopy project artifacts detect: [:each | each path = packagePath]) id]
		ifFalse: [packageId := packagePath].
	workingCopy newSaveOperation
		message: 'first version';
		timestamp: DateAndTime now - 5 minutes;
		applyToWorkingCopy.
	firstVersion := workingCopy baseVersion.
	originalPackageArtifact := firstVersion snapshot artifactAt: packageId.
	^ firstVersion