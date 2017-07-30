initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	copiedObjects := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry2 new.
	replacedObjects := IdentityDictionary new.
	slotValueReplacements := IdentityDictionary new.
	toBeVisited := LinkedList new.
	visited := IdentitySet new.
	slotsToConvert := OrderedCollection new.