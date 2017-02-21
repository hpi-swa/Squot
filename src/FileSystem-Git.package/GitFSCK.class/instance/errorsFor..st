accessing
errorsFor: anObject
	^ errors
		at: anObject
		ifAbsentPut: OrderedCollection new