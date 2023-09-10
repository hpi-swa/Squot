*Squot-Mapper
squotCopyWithSource: aString
	| lines category source |
	lines := aString lines.
	category := lines first.
	source := lines allButFirst joinSeparatedBy: String lf.
	self selector = (Parser new parseSelector: source) ifFalse: [self error: 'expected selector not to change'].
	Parser new parse: source class: ProtoObject. "check syntax"
	^ MCMethodDefinition
		className: self className
		classIsMeta: self classIsMeta
		selector: self selector
		category: category
		timeStamp: self timeStamp
		source: source