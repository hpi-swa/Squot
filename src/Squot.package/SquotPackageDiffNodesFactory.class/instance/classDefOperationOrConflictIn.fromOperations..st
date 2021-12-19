private
classDefOperationOrConflictIn: aDictionary fromOperations: aCollection
	| anyMethod className |
	anyMethod := aCollection detect: [:each | each definition isMethodDefinition] ifNone: [].
	className := anyMethod ifNotNil: [anyMethod definition className].
	^ className ifNotNil:
		[(aDictionary at: className ifAbsent: [#()])
			detect: [:each | each definition isClassDefinition]
			ifNone: []]