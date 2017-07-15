internal
basicReset
	self flag: 'TODO: explicitely pass a revision/commit to the basicreset'.
	self flag: 'TODO: merge with ModificationManager >> clearRootTree'.
	
	cache workingDirectory children do: [ :reference|
		reference deleteAll].
	self repository: repository.
	self initializeWithCache: cache.
	self logMessage: 'basicReset to ', (revision ifNil: ['(orphaned)'] ifNotNil: [revision typeCode, ' ', revision hexHash]).
