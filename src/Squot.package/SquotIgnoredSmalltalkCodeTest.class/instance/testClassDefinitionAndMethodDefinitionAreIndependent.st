tests
testClassDefinitionAndMethodDefinitionAreIndependent
	| method classDef |
	classDef := sampleClass asClassDefinition.
	method := (sampleClass >> #a) asCodeReference asMethodDefinition.
	SquotIgnoredSmalltalkCode ignore: classDef.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode ignore: method; unignore: classDef.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: classDef).
	SquotIgnoredSmalltalkCode unignore: method.