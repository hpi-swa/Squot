initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	copiedObjects := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry new.
	replacedObjects := IdentityDictionary new.
	slotValueReplacements := IdentityDictionary new.
	toBeVisited := LinkedList new.
	slotsToConvert := OrderedCollection new.
	mirrors := IdentityDictionary new.