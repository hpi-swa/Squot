loading
loadCassDefinition
	| classDefinitionFile |
	
	className := classFolder name copyUpToLast: $..
	
	classDefinitionFile := classFolder reference / 'instance-side' / 'definition.st'.
	classDefinitionFile exists ifFalse: [^ nil "probably extension methods"].
	^ ((MCStReader on: classDefinitionFile readStream)
		loadDefinitions;
		definitions) detect: [:each | each isClassDefinition]