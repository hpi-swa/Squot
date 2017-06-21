initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	copiedObjects := IdentityDictionary new.
	objectNameMapping := IdentityDictionary new.
	objectCreatorMapping := IdentityDictionary new.
	objectCreatorSlotMapping := IdentityDictionary new.
	replacedObjects := IdentityDictionary new.
	toBeVisited := Heap sortBlock: [:a :b | a name size <= b name size].
	visited := IdentitySet new.