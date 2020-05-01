tests
testNotIgnoredAfterWholeClassUnignored
	| method classDef |
	classDef := sampleClass asClassDefinition.
	method := (sampleClass >> #a) asCodeReference asMethodDefinition.
	SquotIgnoredSmalltalkCode ignore: classDef; ignore: method.
	SquotIgnoredSmalltalkCode unignoreClass: sampleClass name.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: classDef);
		deny: (SquotIgnoredSmalltalkCode isIgnored: method).