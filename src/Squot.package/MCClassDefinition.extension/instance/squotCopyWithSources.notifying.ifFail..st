*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestors ifFail: aBlock
	| classSide instanceSide comment stString definitions definition |
	instanceSide := aCollection first.
	classSide := aCollection second.
	comment := aCollection third.
	stString := ({
		'!{1}!'.
		'!{2}!'.
		'!{3} commentStamp: {4}!'.
		'{5}!'.
	 } joinSeparatedBy: String lf)
		format: {instanceSide. classSide. self className. self commentStamp printString. comment}.
	definitions := (MCStReader on: stString readStream) definitions.
	definitions size = 1 ifFalse: [^ aBlock value: 'expected to parse exactly one class definition'].
	definition := definitions first.
	definition isClassDefinition ifFalse: [^ aBlock value: 'expected to parse a class definition'].
	definition className = self className ifFalse: [^ aBlock value: 'expected the class name not to change'].
	^ definition