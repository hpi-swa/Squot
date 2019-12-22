running
tearDown
	SystemChangeNotifier uniqueInstance doSilently:
		[classFactory ifNotNil: [classFactory cleanUp]].
	SquotFakeToolSet reset.