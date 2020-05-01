tests
testIgnoreTraitDefinition
	| name trait traitDef |
	name := sampleClass name.
	classFactory delete: sampleClass.
	trait := Trait named: name uses: #() category: classFactory defaultCategory.
	[classFactory createdClasses add: trait.
	traitDef := trait asClassDefinition.
	self ignoreDefinitionTest: traitDef]
		ensure:
			[ChangeSet current removeClassAndMetaClassChanges: trait.
			trait removeFromSystem: false.
			"Cannot use classFactory delete: because it sends messages that Trait does not understand."]