initialize-release
initialize
	comparedObjects := Dictionary new.
	objectDiffs := IdentityDictionary new.
	shadowNames := IdentityDictionary new.
	toBeVisited := OrderedCollection new.