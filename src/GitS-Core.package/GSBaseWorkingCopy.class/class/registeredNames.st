accessing
registeredNames
	^ self registry associations select: [:each | each value isKindOf: self] thenCollect: #key