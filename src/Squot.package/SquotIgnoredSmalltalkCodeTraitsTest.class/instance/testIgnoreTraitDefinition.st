tests
testIgnoreTraitDefinition
	| traitDef |
	traitDef := sampleTrait asClassDefinition.
	self ignoreDefinitionTest: traitDef.