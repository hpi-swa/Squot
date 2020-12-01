tests
ignoreDefinitionTest: aMCDefinition
	self deny: (SquotIgnoredSmalltalkCode isIgnored: aMCDefinition).
	SquotIgnoredSmalltalkCode ignore: aMCDefinition.
	self assert: (SquotIgnoredSmalltalkCode isIgnored: aMCDefinition).
	SquotIgnoredSmalltalkCode unignore: aMCDefinition.
	self deny: (SquotIgnoredSmalltalkCode isIgnored: aMCDefinition).