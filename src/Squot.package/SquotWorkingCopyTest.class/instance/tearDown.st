running
tearDown
	SystemChangeNotifier uniqueInstance doSilently:
		[classFactory cleanUp.
		workingCopy unload].
	(MCWorkingCopy allManagers
		detect: [:each | each packageName = classFactory packageName] ifNone: [])
		ifNotNil: [:createdWorkingCopy | createdWorkingCopy unregister].
	Environment current packageOrganizer unregisterPackageNamed: classFactory packageName.
	(repository respondsTo: #close) ifTrue: [repository close].
	(store respondsTo: #close) ifTrue: [store close].
	changeLogSuppressor tearDown.