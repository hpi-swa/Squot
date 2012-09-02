loading
loadCassDefinition
	"this clearly needs refactoring :/ "
	| tokens classDefinitionFile metaClassDefinitionFile metaDefinition commentFile traitCompositionString lastIndex classTraitCompositionString classDefinitionStream|
	
	className := classFolder name copyUpToLast: $..
	
	classDefinitionFile := classFolder reference / 'instance-side' / 'definition.st'.
	classDefinitionStream := classDefinitionFile readStream contents asString.
	tokens := Scanner new scanTokens: classDefinitionStream.
	
	classDefinitionStream := classDefinitionStream readStream.
	traitCompositionString := (classDefinitionStream
		match: 'uses:';
		upToAll: 'instanceVariableNames:') withBlanksTrimmed.
	traitCompositionString isEmptyOrNil ifTrue: [traitCompositionString := '{}'].
	
	metaClassDefinitionFile := classFolder reference / 'class-side' / 'definition.st'.
	
	metaClassDefinitionFile exists ifTrue: [
		classTraitCompositionString := (metaClassDefinitionFile readStream contents asString readStream
			match: 'uses:';
			upToAll: 'instanceVariableNames:') withBlanksTrimmed].
		
	classTraitCompositionString isEmptyOrNil ifTrue: [classTraitCompositionString := '{}'].
	lastIndex := tokens size.
	commentFile := classFolder reference / 'README.txt'.
	
	^ MCClassDefinition
		name: (tokens at: 3)
		superclassName: (tokens at: 1)
		traitComposition: traitCompositionString
		classTraitComposition: classTraitCompositionString
		category: (tokens at: lastIndex - 1)
		instVarNames: ((tokens at: 5) findTokens: ' ')
		classVarNames: ((tokens at: 7) findTokens: ' ')
		poolDictionaryNames: ((tokens at: lastIndex - 2) findTokens: ' ')
		classInstVarNames: (self classInstVarNames)
		type: (self typeOfSubclass: (tokens at: 2))
		comment: commentFile readStream contents asString
		commentStamp: (TimeStamp now)