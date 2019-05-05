initialize-release
initialize
	objects := Dictionary new. "path -> object"
	paths := IdentityDictionary new. "object -> collection of path"
	additionalInfo := Dictionary new. "path -> Dictionary"
	loadOrder := OrderedCollection new. "paths"
	environment := Environment current.
	
	self initializeTrackedFiles.