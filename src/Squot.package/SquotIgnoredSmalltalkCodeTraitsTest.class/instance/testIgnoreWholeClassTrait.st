tests
testIgnoreWholeClassTrait
	| method traitDef |
	traitDef := sampleTrait classTrait asMCDefinition.
	method := (sampleTrait classTrait >> sampleClassTraitMethod) asCodeReference asMethodDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode ignoreClass: sampleTrait classTrait name.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		assert: (SquotIgnoredSmalltalkCode isIgnored: method);
		assert: (SquotIgnoredSmalltalkCode isWholeClassIgnored: traitDef baseTrait, ' classTrait').
	SquotIgnoredSmalltalkCode unignoreClass: sampleTrait classTrait name.
	self deny: (SquotIgnoredSmalltalkCode isWholeClassIgnored: traitDef baseTrait, ' classTrait');
		deny: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).