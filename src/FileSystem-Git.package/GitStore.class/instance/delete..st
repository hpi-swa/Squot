delegate
delete: anObject
	self logMessage: 'Deleting ', anObject printString.
	(cache exists: anObject)
			ifTrue: [ cache delete: anObject].
	modManager
		markDeleted: anObject.