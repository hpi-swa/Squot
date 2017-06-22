initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	copiedObjects := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry new.
	replacedObjects := IdentityDictionary new.
	toBeVisited := Heap sortBlock: [:a :b | a name size <= b name size].
	visited := IdentitySet new.