rematerializing
materializeLike: anObject onBehalfOf: aMaterializer "ImageStore"
	"Answer a new object like my original, borrowing from anObject if necessary."
	| newObject |
	newObject := originalClass isVariable
		ifTrue: [originalClass basicNew: variableSizePart size]
		ifFalse: [originalClass basicNew].
	originalClass allInstVarNames do: [:each | | storedValue |
		storedValue := instVars at: each ifAbsent: [anObject instVarNamed: each].
		newObject
			instVarNamed: each
			put: (storedValue
				asLoadedBySquot: aMaterializer
				like: (anObject instVarNamed: each))].
	(originalClass isVariable and: [variableSizePart notNil]) ifTrue:
		[1 to: variableSizePart size do: [:index | | storedValue |
			storedValue := variableSizePart at: index.
			newObject
				at: index
				put: (storedValue
					asLoadedBySquot: aMaterializer
					like: (anObject at: index ifAbsent: []))]].
	^ newObject