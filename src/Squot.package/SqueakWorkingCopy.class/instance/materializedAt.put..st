materialized
materializedAt: aPath put: anObject
	self materialized at: aPath put: anObject.
	self changed: #materialized.