initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	copiedObjects := IdentityDictionary new.
	decoratedObjects := IdentityDictionary new.
	objectNameMapping := IdentityDictionary new.
	toBeVisited := Heap sortBlock: [:a :b | a name size <= b name size].
	visited := IdentitySet new.