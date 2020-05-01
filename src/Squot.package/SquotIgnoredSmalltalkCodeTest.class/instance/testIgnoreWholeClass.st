tests
testIgnoreWholeClass
	| method classDef |
	classDef := sampleClass asClassDefinition.
	method := (sampleClass >> #a) asCodeReference asMethodDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: classDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode ignoreClass: sampleClass name.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: classDef);
		assert: (SquotIgnoredSmalltalkCode isIgnored: method);
		assert: (SquotIgnoredSmalltalkCode isWholeClassIgnored: classDef className).
	SquotIgnoredSmalltalkCode unignoreClass: sampleClass name.
	self deny: (SquotIgnoredSmalltalkCode isWholeClassIgnored: classDef className);
		deny: (SquotIgnoredSmalltalkCode isIgnored: classDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).