setUp
unloadPackage
	| artifactSnapshot |
	artifactSnapshot := (workingCopy artifactAt: packagePath) snapshot.
	sampleClass := sampleClass name.
	SystemChangeNotifier uniqueInstance doSilently:
		[MCPackageLoader unloadPackage: packageInfo mcPackage].
	workingCopy
		removeAt: packagePath;
		addUnloaded: artifactSnapshot.
	^ workingCopy artifactAt: packagePath