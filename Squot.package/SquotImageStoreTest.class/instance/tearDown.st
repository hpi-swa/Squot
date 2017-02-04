running
tearDown
	imageStore := nil.
	changeLogSuppressor suppressChangeNotificationsDuring: [
		classFactory cleanUp.
		createdClasses do: [:each | each removeFromSystemUnlogged].
		testEnvironment destroy].
	changeLogSuppressor tearDown.
	changeLogSuppressor := nil.