patching
addToLoaded: aDictionary with: aPatcher
	aDictionary add: (aPatcher rematerialize: self association).