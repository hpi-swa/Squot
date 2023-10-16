definitions-operations
addDefinition: aDefinition
	index
		definitionLike: aDefinition
		ifPresent: [:other |
			other = aDefinition
				ifFalse: [self addConflictWithLeft: other right: aDefinition base: nil]]
		ifAbsent: [self addOperation: (MCAddition of: aDefinition)]