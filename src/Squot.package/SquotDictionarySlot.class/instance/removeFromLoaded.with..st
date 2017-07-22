patching
removeFromLoaded: aDictionary with: aPatcher
	aDictionary removeKey: (aPatcher rematerialize: self association) key ifAbsent: []