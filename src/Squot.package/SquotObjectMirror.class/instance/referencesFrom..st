enumerating
referencesFrom: anObject
	^ (class instVarNames collect: [:each | SquotInstanceVariable named: each]),
		((1 to: (thisContext objectSize: anObject)) collect: [:each | SquotIndexableField index: each])