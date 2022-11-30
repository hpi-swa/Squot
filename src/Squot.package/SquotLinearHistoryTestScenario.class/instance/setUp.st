running
setUp
	classFactory := ClassFactoryForTestCase new.
	SystemChangeNotifier uniqueInstance doSilently: [sampleClass := classFactory newClass].
	packageInfo := PackageInfo named: classFactory packageName.
	packagePath := (MCSnapshot empty asSquotArtifactForPackage: packageInfo) path.
	workingCopy add: packageInfo at: packagePath.
	repository withUnitOfWork:
		[self createVersionA1;
			createVersionB;
			createVersionA2].