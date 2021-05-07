testing
atEnd
	| nextVersion |
	[searchFrontier ifEmpty: [^ true].
	nextVersion := searchFrontier removeFirst.
	self enqueueParentsOf: nextVersion.
	nextVersion isReachableFromSink]
		whileTrue.
	searchFrontier "Heap" add: nextVersion. "put it back for #next"
	^ false