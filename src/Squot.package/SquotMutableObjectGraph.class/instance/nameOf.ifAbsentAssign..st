accessing
nameOf: anObject ifAbsentAssign: nameBlock
	| name |
	^ objectNames at: anObject
		ifAbsent:
			[name := delegateRegistry
				ifNotNil: [delegateRegistry nameOf: anObject ifAbsentAssign: nameBlock]
				ifNil: [nameBlock value].
			objectNames at: anObject put: name.
			objects at: name put: anObject.
			name]