*Squot-Mapper
squotCopyWithSource: aString
	| definitions definition |
	definitions := (MCStReader on: aString readStream) definitions.
	definitions size = 1 ifTrue: [self error: 'expected to parse exactly one class trait definition'].
	definition := definitions first.
	(definition isTraitDefinition and: [definition isClassDefinition not])
		ifFalse: [self error: 'expected to parse a class trait definition'].
	^ definition