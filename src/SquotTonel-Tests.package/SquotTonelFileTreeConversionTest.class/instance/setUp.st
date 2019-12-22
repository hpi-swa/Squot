running
setUp
	repository := SquotFileTestRepository new initializeInDirectory: FileSystem memory root.
	workingCopy :=
		repository createWorkingCopy
			store: SquotImageStore new;
			yourself.
	classFactory := ClassFactoryForTestCase new.
	(SystemChangeNotifier uniqueInstance doSilently: [classFactory newClass])
		compileSilently: 'testMethod ^ 42'.
	workingCopy add: (PackageInfo named: classFactory packageName) at: 'src'.