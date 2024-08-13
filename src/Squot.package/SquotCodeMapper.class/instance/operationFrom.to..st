definitions
operationFrom: aDefinition to: anotherDefinition
	aDefinition = anotherDefinition ifTrue: [^ nil].
	aDefinition ifNil: [^ MCAddition of: anotherDefinition].
	anotherDefinition ifNil: [^ MCRemoval of: aDefinition].
	^ MCModification of: aDefinition to: anotherDefinition