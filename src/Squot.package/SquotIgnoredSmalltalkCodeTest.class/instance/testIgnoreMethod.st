tests
testIgnoreMethod
	| method |
	method := (sampleClass >> #a) asCodeReference asMethodDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode ignore: method.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: method).
	SquotIgnoredSmalltalkCode unignore: method.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: method).