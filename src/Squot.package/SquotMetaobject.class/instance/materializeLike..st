rematerializing
materializeLike: anObject
	"Answer a new object like my original, borrowing from anObject if necessary."
	| newObject |
	newObject := originalClass isVariable
		ifTrue: [originalClass basicNew: variableSizePart size]
		ifFalse: [originalClass basicNew].
	originalClass allInstVarNames do: [:each | | storedValue |
		storedValue := instVars at: each ifAbsent: [anObject instVarNamed: each].
		self flag: 'isKindOf: should be avoided'.
		(storedValue isKindOf: self class)
			ifTrue: [newObject instVarNamed: each
					put: (storedValue materializeLike: (anObject instVarNamed: each))]
			ifFalse: [newObject instVarNamed: each
					put: storedValue]].
	(originalClass isVariable and: [variableSizePart notNil]) ifTrue:
		[1 to: variableSizePart size do: [:index | | storedValue |
			storedValue := variableSizePart at: index.
			self flag: 'isKindOf: should be avoided'.
			(storedValue isKindOf: self class)
				ifTrue: [newObject at: index put: (storedValue materializeLike: (anObject at: index))]
				ifFalse: [newObject at: index put: storedValue]]].
	^ newObject