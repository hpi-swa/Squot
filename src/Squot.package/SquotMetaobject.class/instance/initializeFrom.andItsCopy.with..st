initialize-release
initializeFrom: anObject andItsCopy: copyOfAnObject with: metaobjectBuilder
	originalClass := anObject class.
	anObject class allInstVarNames do: [:each | | originalValue copyValue |
		originalValue := anObject instVarNamed: each.
		copyValue := copyOfAnObject instVarNamed: each.
		instVars
			at: each
			put: (metaobjectBuilder squotContentFrom: originalValue andItsCopy: copyValue)].
	originalClass isVariable ifTrue:
		[variableSizePart := Array new: anObject size.
		1 to: copyOfAnObject basicSize do: [:index | | originalValue copyValue |
			originalValue := anObject at: index.
			copyValue := copyOfAnObject at: index.
			variableSizePart
				at: index
				put: (metaobjectBuilder squotContentFrom: originalValue andItsCopy: copyValue)]].