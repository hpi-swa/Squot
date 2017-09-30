initialize-release
initialize
	objectDiffs := IdentityDictionary new.
	shadowNames := IdentityDictionary new.
	toBeVisited := OrderedCollection new.
	visited := IdentitySet new.
	referrers := IdentityDictionary new.
	objectsWithChanges := IdentitySet new.
	graphDiff := SquotObjectGraphDiff new.