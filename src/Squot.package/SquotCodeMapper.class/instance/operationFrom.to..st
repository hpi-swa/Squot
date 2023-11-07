definitions
operationFrom: aDefinition to: anotherDefinition
	aDefinition = anotherDefinition ifTrue: [^ nil].
	^ aDefinition
		ifNil: [MCAddition of: anotherDefinition]
		ifNotNil: [
			anotherDefinition
				ifNil: [MCRemoval of: aDefinition]
				ifNotNil: [MCModification of: aDefinition to: anotherDefinition]]