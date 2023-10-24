*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestors ifFail: aBlock
	| category source sourceRequestor timeStamp |
	category := aCollection first.
	source := aCollection second.
	sourceRequestor := requestors second.
	timeStamp := aCollection third.
	self selector = (Parser new parseSelector: source) ifFalse: [^ aBlock value: 'expected selector not to change'].
	[Parser new "check syntax"
		parse: source
		class: ProtoObject
		noPattern: false
		notifying: sourceRequestor
		ifFail: [^ aBlock value: 'failed to parse the source']]
		on: UndeclaredVariable
		do: [:exception | exception resume: UndeclaredVariableNode new].
	^ MCMethodDefinition
		className: self className
		classIsMeta: self classIsMeta
		selector: self selector
		category: category
		timeStamp: timeStamp
		source: source