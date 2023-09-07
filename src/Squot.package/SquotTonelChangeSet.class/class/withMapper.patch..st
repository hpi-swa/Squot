instance creation
withMapper: aMapper patch: aPatch
	^ (self withMapper: aMapper)
		patch: aPatch;
		yourself