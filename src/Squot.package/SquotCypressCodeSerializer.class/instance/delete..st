private
delete: aMCDefinition
	aMCDefinition isMethodDefinition ifTrue: [^ self deleteMethod: aMCDefinition].
	aMCDefinition isClassDefinition ifTrue: [^ self deleteClassifier: aMCDefinition].
	self halt.
	