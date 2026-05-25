as yet unclassified
create
	self
		initializeHasher;
		createOutput;
		writeSourceSize;
		writeTargetSize;
		writeInsertionsWhileInitializingHashValue;
		mainLoop;
		ensureInsertionCountIsWritten;
		checkMaxSize.
	^ self output