initialize-release
initializeFor: anObject
	| copy |
	originalClass := anObject class.
	copy := anObject copy. "do this to inspect the results of postCopy"
	anObject class allInstVarNames do: [:each | | originalValue copyValue |
		originalValue := anObject instVarNamed: each.
		originalValue == (copyValue := copy instVarNamed: each)
			ifTrue: [instVars at: each put: originalValue]
			ifFalse: [instVars at: each put: originalValue asSquotContent]].
	originalClass isVariable ifTrue:
		[variableSizePart := Array new: anObject size.
		1 to: anObject basicSize do: [:index | | originalValue copyValue |
			originalValue := anObject at: index.
			originalValue == (copyValue := copy at: index)
				ifTrue: [variableSizePart at: index put: originalValue]
				ifFalse: [variableSizePart at: index put: originalValue asSquotContent]]].