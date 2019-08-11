testing
modifies: anObject
	| key |
	key := self keyOf: anObject ifAbsent: [^ false].
	^ self includesModificationAt: key