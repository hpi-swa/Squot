*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestors ifFail: aBlock
	| source comment stString definitions definition |
	source := aCollection first.
	comment := aCollection second.
	stString := ({
		'!{1}!'.
		'!{2} commentStamp: {3}!'.
		'{4}!'.
	 } joinSeparatedBy: String lf)
		format: {source. self className. self commentStamp printString. comment}.
	definitions := (MCStReader on: stString readStream) definitions.
	definitions size = 1 ifFalse: [^ aBlock value: 'expected to parse exactly one trait definition'].
	definition := definitions first.
	(definition isClassDefinition and: [definition isTraitDefinition]) ifFalse: [^ aBlock value: 'expected to parse a trait definition'].
	definition className = self className ifFalse: [^ aBlock value: 'expected the trait name not to change'].
	^ definition