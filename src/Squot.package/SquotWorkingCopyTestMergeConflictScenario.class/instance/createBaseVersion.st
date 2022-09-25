setUp
createBaseVersion
	SystemChangeNotifier uniqueInstance doSilently: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	packagePath := (MCSnapshot empty asSquotArtifactForPackage: packageInfo) path.
	workingCopy add: packageInfo at: packagePath.
	SquotToggles useNewApi
		ifTrue: [packageId := packagePath := (workingCopy project artifacts detect: [:each | each path = packagePath]) id]
		ifFalse: [packageId := (workingCopy artifactAt: packagePath) id].
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.