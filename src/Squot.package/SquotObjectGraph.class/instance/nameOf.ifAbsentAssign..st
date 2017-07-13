accessing
nameOf: anObject ifAbsentAssign: nameBlock
	| name |
	^ super nameOf: anObject
		ifAbsent:
			[name := delegateRegistry nameOf: anObject ifAbsentAssign: nameBlock.
			super nameOf: anObject ifAbsentAssign: [name].
			objects at: name put: anObject.
			name]