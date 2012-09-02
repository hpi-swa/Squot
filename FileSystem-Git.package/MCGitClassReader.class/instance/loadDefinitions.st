loading
loadDefinitions
	classDefinition := self loadCassDefinition.
	definitions add: classDefinition.
	
	instanceMethodDefinitions := self loadInstanceMethodDefinitions.
	definitions addAll: instanceMethodDefinitions.
	
	classMethodDefinitions := self loadClassMethodDefinitions.
	definitions addAll: classMethodDefinitions.