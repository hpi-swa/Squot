private
delete: aMCDefinition
	aMCDefinition isMethodDefinition ifTrue: [^ self deleteMethod: aMCDefinition].
	aMCDefinition isClassDefinition ifTrue: [^ self deleteClassifier: aMCDefinition].
	aMCDefinition isScriptDefinition ifTrue: [^ self deleteScript: aMCDefinition].
	self halt.
	