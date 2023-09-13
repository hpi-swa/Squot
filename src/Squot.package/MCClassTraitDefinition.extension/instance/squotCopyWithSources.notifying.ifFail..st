*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestor ifFail: aBlock
	| definitions definition |
	definitions := (MCStReader on: aCollection first readStream) definitions.
	definitions size = 1 ifTrue: [^ aBlock value: 'expected to parse exactly one class trait definition'].
	definition := definitions first.
	(definition isTraitDefinition and: [definition isClassDefinition not])
		ifFalse: [^ aBlock value: 'expected to parse a class trait definition'].
	^ definition