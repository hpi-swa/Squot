accessing
ignoreInstanceVariables: aCollectionOfStrings in: anObject
	| ignored |
	ignored := self ignoredInstanceVariables.
	ignored
		at: anObject
		put: ((ignored at: anObject ifAbsentPut: [Array withAll: aCollectionOfStrings. ^ self])
				, aCollectionOfStrings).