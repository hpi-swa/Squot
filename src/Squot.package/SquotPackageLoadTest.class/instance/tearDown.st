running
tearDown
	classFactory cleanUp.
	ChangeSet removeChangeSetsNamedSuchThat: [:each | each beginsWith: package name].