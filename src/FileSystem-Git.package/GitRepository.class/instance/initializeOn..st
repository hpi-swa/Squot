initialize-release
initializeOn: anFSReference
	reference := anFSReference.
	self initializeCache.
	self gitInitialize