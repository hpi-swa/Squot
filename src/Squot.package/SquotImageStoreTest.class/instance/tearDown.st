running
tearDown
	imageStore := nil.
	(MCPackage named: classFactory packageName) in:
		[:package | package hasWorkingCopy ifTrue: [package workingCopy unregister]].
	changeLogSuppressor suppressChangeNotificationsDuring: [
		classFactory cleanUp.
		createdClasses do: [:each | classFactory delete: each]].
	changeLogSuppressor tearDown.
	changeLogSuppressor := nil.