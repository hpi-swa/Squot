*Squot-Mapper
squotCopyWithSource: aString
	| parts classSide instanceSide comment stString definitions definition |
	parts := (self squotPartsFromSource: aString) collect: #withBlanksTrimmed.
	parts size >= 3 ifFalse: [self error: 'expected at least two blank lines'].
	instanceSide := parts first.
	classSide := parts second.
	comment := (parts allButFirst: 2) joinSeparatedBy: String lf, String lf.
	(comment notEmpty and: [comment first = $"] and: [comment last = $"])
		ifFalse: [self error: 'expected the comment to be surrounded by double quotes'].
	comment := comment copyFrom: 2 to: comment size - 1.
	stString := ({
		'!{1}!'.
		'!{2}!'.
		'!{3} commentStamp: {4}!'.
		'{5}!'.
	 } joinSeparatedBy: String lf)
		format: {instanceSide. classSide. self className. self commentStamp printString. comment}.
	definitions := (MCStReader on: stString readStream) definitions.
	definitions size = 1 ifFalse: [self error: 'expected to parse exactly one class definition'].
	definition := definitions first.
	definition isClassDefinition ifFalse: [self error: 'expected to parse a class definition'].
	definition className = self className ifFalse: [self error: 'expected the class name not to change'].
	^ definition
	