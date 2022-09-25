running
createFirstMergeParent
	SystemChangeNotifier uniqueInstance doSilently: [class1 := classFactory newClass].
	class1 compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo1 := PackageInfo named: classFactory packageName.
	packagePath1 := (MCSnapshot empty asSquotArtifactForPackage: packageInfo1) path.
	workingCopy add: packageInfo1 at: packagePath1.
	SquotToggles useNewApi
		ifTrue: [packageId1 := packagePath1 := (workingCopy project artifacts detect: [:each | each path = packagePath1]) id]
		ifFalse: [packageId1 := (workingCopy artifactAt: packagePath1) id].
	workingCopy saveVersionWithMessage: 'first version'.
	firstVersion := workingCopy baseVersion.
	Environment current packageOrganizer unregisterPackageNamed: classFactory packageName.
	classFactory cleanUp.