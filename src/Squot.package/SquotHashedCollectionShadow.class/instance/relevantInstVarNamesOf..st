initialize-release
relevantInstVarNamesOf: aDictionary
	^ (super relevantInstVarNamesOf: aDictionary) difference: HashedCollection instVarNames