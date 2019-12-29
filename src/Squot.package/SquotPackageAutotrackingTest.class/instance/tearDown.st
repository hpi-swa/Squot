running
tearDown
	SystemChangeNotifier uniqueInstance  doSilently: [classFactory cleanUp].
	super tearDown.