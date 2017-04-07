rematerializing
materializeAs: anObject with: aMaterializer
	"Fill anObject like my original"
	originalClass allInstVarNames do: [:each |
		instVars at: each ifPresent: [:storedValue |
			anObject instVarNamed: each put: (aMaterializer rematerialize: storedValue)]].
	(originalClass isVariable and: [variableSizePart notNil]) ifTrue:
		[1 to: variableSizePart size do: [:index | | storedValue |
			storedValue := variableSizePart at: index.
			anObject
				basicAt: index
				put: (aMaterializer rematerialize: storedValue)]].
	^ anObject