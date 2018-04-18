running
tearDown
	SystemChangeNotifier uniqueInstance doSilently: [classFactory2 cleanUp].
	(MCWorkingCopy allManagers
		detect: [:each | each packageName = classFactory2 packageName] ifNone: [])
		ifNotNil: [:createdWorkingCopy | createdWorkingCopy unregister].
	super tearDown. 