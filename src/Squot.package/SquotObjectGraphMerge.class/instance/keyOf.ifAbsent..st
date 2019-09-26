accessing
keyOf: anObject ifAbsent: aBlock
	^ working nameOf: anObject undecorated ifAbsent:
		[incoming nameOf: anObject undecorated ifAbsent:
			[base
				ifNil: [^ aBlock value]
				ifNotNil: [base nameOf: anObject undecorated ifAbsent: aBlock]]].