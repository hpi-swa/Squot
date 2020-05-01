tests
testIgnoreClassDefinition
	| classDef |
	classDef := sampleClass asClassDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: classDef).
	SquotIgnoredSmalltalkCode ignore: classDef.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: classDef);
		deny: (SquotIgnoredSmalltalkCode isWholeClassIgnored: classDef className).
	SquotIgnoredSmalltalkCode unignore: classDef.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: classDef).