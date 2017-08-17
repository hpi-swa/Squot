initialize-release
initialize
	shadows := Dictionary new.
	objectNames := WeakIdentityKeyDictionary new.
	self initializeObjectCreatorDictionaries.