tests
testIgnoreClassTraitMethod
	| methodDef |
	methodDef := (sampleTrait classTrait >> sampleClassTraitMethod) asCodeReference asMethodDefinition.
	self ignoreDefinitionTest: methodDef.