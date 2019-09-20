running
tearDown
	imageStore := nil.
	(MCPackage named: classFactory packageName) in:
		[:package | package hasWorkingCopy ifTrue: [package workingCopy unregister]].
	changeLogSuppressor suppressChangeNotificationsDuring: [
		classFactory cleanUp.
		createdClasses do: [:each | classFactory delete: each].
		testEnvironment allClassesAndTraits do: [:each | classFactory delete: each].
		testEnvironment destroy].
	ChangeSet removeChangeSetsNamedSuchThat:
		[:each | each beginsWith: classFactory packageName].