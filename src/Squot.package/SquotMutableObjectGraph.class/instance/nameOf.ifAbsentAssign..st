accessing
nameOf: anObject ifAbsentAssign: nameBlock
	| name |
	^ objectNames at: anObject
		ifAbsent:
			[name := delegateRegistry
				ifNotNil: [delegateRegistry nameOf: anObject ifAbsentAssign: nameBlock]
				ifNil: [nameBlock value].
			self assign: name to: anObject.
			name]