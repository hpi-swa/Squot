initialize-release
initializeOn: anFSReference
	self assert: anFSReference class = FSReference.
	reference := anFSReference.
	self gitInitialize