private
classDefOperationOrConflictFor: aCollection
	| anyMethod className |
	anyMethod := aCollection
		detect:
			[:each |
			each definition isClassDefinition ifTrue: [^ each].
			each definition isMethodDefinition]
		ifNone: [^ nil].
	className := anyMethod definition className.
	^ (groups at: className ifAbsent: [^ nil])
			detect: [:each | each definition isClassDefinition]
			ifNone: []