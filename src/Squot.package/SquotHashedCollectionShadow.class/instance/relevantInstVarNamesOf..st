initialize-release
relevantInstVarNamesOf: anObject
	^ anObject class allInstVarNames copyWithoutAll: HashedCollection instVarNames