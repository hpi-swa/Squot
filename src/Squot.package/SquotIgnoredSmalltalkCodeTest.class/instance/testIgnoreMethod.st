tests
testIgnoreMethod
	| method |
	method := (sampleClass >> #a) asCodeReference asMethodDefinition.
	self ignoreDefinitionTest: method.