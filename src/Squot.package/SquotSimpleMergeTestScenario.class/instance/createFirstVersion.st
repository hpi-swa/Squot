setUp
createFirstVersion
	SystemChangeNotifier uniqueInstance doSilently: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	packagePath := (MCSnapshot empty asSquotArtifactForPackage: packageInfo) path.
	workingCopy add: packageInfo at: packagePath.
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.
	^ firstVersion