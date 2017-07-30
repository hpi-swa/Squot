initialize-release
initialize
	convertedObjects := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry new.
	targetGraph := SquotMutableObjectGraph new.