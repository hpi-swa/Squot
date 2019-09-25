accessing
nameOf: anObject ifAbsentAssign: nameBlock
	| name |
	^ objectNames at: anObject
		ifAbsent:
			[name := delegateRegistry
				ifNotNil: [delegateRegistry nameOf: anObject ifAbsentAssign: nameBlock]
				ifNil: [nameBlock value].
			self assert: anObject hasSquotShadowName not
				description: 'Object should be stripped of name decoration'.
			objectNames at: anObject put: name.
			objects at: name put: anObject.
			name]