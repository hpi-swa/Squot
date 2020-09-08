tests
testIgnoreClassTraitDefinition
	| traitDef |
	traitDef := sampleTrait classTrait asMCDefinition.
	self ignoreDefinitionTest: traitDef.