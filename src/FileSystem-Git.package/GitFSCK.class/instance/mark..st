validating
mark: anObject
	unreachable remove: anObject ifAbsent: [].
	reachable add: anObject.