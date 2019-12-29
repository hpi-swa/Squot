running
tearDown
	self suppressChangeNotificationsDuring: [classFactory cleanUp].
	ChangeSet removeChangeSetsNamedSuchThat: [:each | each beginsWith: package name].