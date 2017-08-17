copying
postCopy
	objectNames := objectNames copy.
	shadows := shadows copy.
	self evictObjectNames.
	self initializeObjectCreatorDictionaries.