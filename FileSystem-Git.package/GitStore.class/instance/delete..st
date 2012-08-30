delegate
delete: anObject
	(cache exists: anObject)
			ifTrue: [ cache delete: anObject].
	modManager
		markDeleted: anObject.