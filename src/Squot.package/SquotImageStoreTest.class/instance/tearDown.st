running
tearDown
	imageStore := nil.
	changeLogSuppressor suppressChangeNotificationsDuring: [
		classFactory cleanUp.
		createdClasses do: [:each | classFactory delete: each].
		testEnvironment allClassesAndTraits do: [:each | classFactory delete: each].
		testEnvironment destroy].
	changeLogSuppressor tearDown.
	changeLogSuppressor := nil.