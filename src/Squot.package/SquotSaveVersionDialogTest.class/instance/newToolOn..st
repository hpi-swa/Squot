as yet unclassified
newToolOn: aPatch
	^ (SquotSaveVersionDialog on: aPatch)
		message: 'this is a test';
		yourself