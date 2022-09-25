running
createSecondMergeParent
	SystemChangeNotifier uniqueInstance doSilently: [class2 := classFactory2 newClass].
	class2 compileSilently: 'secondMethod ^ self' classified: 'methods of second version'.
	packageInfo2 := PackageInfo named: classFactory2 packageName.
	packagePath2 := (MCSnapshot empty asSquotArtifactForPackage: packageInfo2) path.
	otherHistorian := (repository historianNamed: 'other').
	workingCopy loadedHistorian: otherHistorian.
	workingCopy removeAt: packagePath1.
	workingCopy add: packageInfo2 at: packagePath2.
	SquotToggles useNewApi
		ifTrue: [packageId2 := packagePath2 := (workingCopy project artifacts detect: [:each | each path = packagePath2]) id]
		ifFalse: [packageId2 := (workingCopy artifactAt: packagePath2) id].
	workingCopy saveVersionWithMessage: 'second version'.
	secondVersion := workingCopy baseVersion.