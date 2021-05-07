tests
testIgnoreWholeTrait
	| method traitDef |
	traitDef := sampleTrait asClassDefinition.
	method := (sampleTrait >> #a) asCodeReference asMethodDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode ignoreClass: sampleTrait name.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		assert: (SquotIgnoredSmalltalkCode isIgnored: method);
		assert: (SquotIgnoredSmalltalkCode isWholeClassIgnored: traitDef className).
	SquotIgnoredSmalltalkCode unignoreClass: sampleTrait name.
	self deny: (SquotIgnoredSmalltalkCode isWholeClassIgnored: traitDef className);
		deny: (SquotIgnoredSmalltalkCode isIgnored: traitDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).