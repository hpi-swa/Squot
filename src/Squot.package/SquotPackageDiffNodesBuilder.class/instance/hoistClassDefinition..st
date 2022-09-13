private
hoistClassDefinition: aCollection
	| classOperation |
	classOperation := aCollection detect: [:each | each definition isClassDefinition] ifNone: [].
	^ classOperation
		ifNil: [aCollection]
		ifNotNil: [{classOperation},
			"All other definitions; use identity comparison to reject because there can be mixture of MCPatchOperation and MCConflict and they are not =-comparable (hence we cannot use copyWithout:, for example)."
			(aCollection reject: [:each | classOperation == each])]