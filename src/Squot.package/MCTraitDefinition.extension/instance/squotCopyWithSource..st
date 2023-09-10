*Squot-Mapper
squotCopyWithSource: aString
	| parts source comment stString definitions definition |
	parts := (self squotPartsFromSource: aString) collect: #withBlanksTrimmed.
	parts size >= 2 ifFalse: [self error: 'expected at least one blank line'].
	source := parts first.
	comment := (parts allButFirst) joinSeparatedBy: String lf, String lf.
	(comment notEmpty and: [comment first = $"] and: [comment last = $"])
		ifFalse: [self error: 'expected the comment to be surrounded by double quotes'].
	comment := comment copyFrom: 2 to: comment size - 1.
	stString := ({
		'!{1}!'.
		'!{2} commentStamp: {3}!'.
		'{4}!'.
	 } joinSeparatedBy: String lf)
		format: {source. self className. self commentStamp printString. comment}.
	definitions := (MCStReader on: stString readStream) definitions.
	definitions size = 1 ifFalse: [self error: 'expected to parse exactly one trait definition'].
	definition := definitions first.
	(definition isClassDefinition and: [definition isTraitDefinition]) ifFalse: [self error: 'expected to parse a trait definition'].
	definition className = self className ifFalse: [self error: 'expected the trait name not to change'].
	^ definition
	