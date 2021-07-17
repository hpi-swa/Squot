setUp
createBaseVersion
	
	SystemChangeNotifier uniqueInstance doSilently: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	sampleClass compileSilently: 'conflictMethod ^ 0'
		classified: 'conflict methods'.
	secondMethodSource := (sampleClass >> #conflictMethod) getSource asString.
	packageInfo := PackageInfo named: classFactory packageName.
	packagePath := (MCSnapshot empty asSquotArtifactForPackage: packageInfo) path.
	workingCopy add: packageInfo at: packagePath.
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.