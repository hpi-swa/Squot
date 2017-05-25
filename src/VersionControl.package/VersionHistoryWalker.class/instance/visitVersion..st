private
visitVersion: aMarkedVersion
	| aVersion |
	aVersion := aMarkedVersion object.
	self enqueueParentsOf: aMarkedVersion.
	aMarkedVersion isReachableFromSink ifFalse:
		[versionBlock
			ifNotNil: [versionBlock value: aVersion]
			ifNil: [versionList add: aVersion]].