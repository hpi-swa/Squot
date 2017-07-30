initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry2 new.
	targetGraph := SquotMutableObjectGraph new.