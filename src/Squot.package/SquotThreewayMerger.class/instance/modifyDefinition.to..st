definitions-operations
modifyDefinition: baseDefinition to: targetDefinition
	index
		definitionLike: baseDefinition
		ifPresent: [:other |
			other = baseDefinition
				ifTrue: [self addOperation: (MCModification of: baseDefinition to: targetDefinition)]
				ifFalse: [other = targetDefinition
							ifFalse: [self addConflictWithLeft: other right: targetDefinition base: baseDefinition]]]
		ifAbsent: [self addConflictWithLeft: nil right: targetDefinition base: baseDefinition]