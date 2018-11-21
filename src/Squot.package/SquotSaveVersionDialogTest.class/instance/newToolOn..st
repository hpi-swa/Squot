as yet unclassified
newToolOn: aPatch
	^ SquotSaveVersionDialog new
		patch: aPatch;
		message: 'this is a test';
		yourself