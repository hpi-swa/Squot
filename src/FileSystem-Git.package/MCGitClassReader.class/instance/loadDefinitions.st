loading
loadDefinitions
	classDefinition := self loadCassDefinition.
	classDefinition ifNotNil: [definitions add: classDefinition].
	
	instanceMethodDefinitions := self loadInstanceMethodDefinitions.
	definitions addAll: instanceMethodDefinitions.
	
	classMethodDefinitions := self loadClassMethodDefinitions.
	definitions addAll: classMethodDefinitions.