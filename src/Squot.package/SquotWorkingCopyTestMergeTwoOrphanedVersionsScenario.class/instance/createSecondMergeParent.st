running
createSecondMergeParent
	SystemChangeNotifier uniqueInstance doSilently: [class2 := classFactory2 newClass].
	class2 compileSilently: 'secondMethod ^ self' classified: 'methods of second version'.
	packageInfo2 := PackageInfo named: classFactory2 packageName.
	packagePath2 := (MCSnapshot empty asSquotArtifactForPackage: packageInfo2) path.
	otherHistorian := (repository historianNamed: 'other').
	workingCopy loadedHistorian: otherHistorian.
	workingCopy artifacts copy do: [:each | workingCopy removeAt: each path].
	workingCopy add: packageInfo2 at: packagePath2.
	workingCopy saveVersionWithMessage: 'second version'.
	secondVersion := workingCopy baseVersion.