materialized
materializedAt: aPath put: anObject
	anObject
		ifNotNil: [self materialized at: aPath put: anObject]
		ifNil: [self materialized removeKey: aPath ifAbsent: [^ self]].
	self changed: #materialized.