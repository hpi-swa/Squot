copying
copyFrom: anObject
	(self class allInstVarNames intersection: anObject class allInstVarNames)
		do: [:each | self instVarNamed: each put: (anObject instVarNamed: each)].