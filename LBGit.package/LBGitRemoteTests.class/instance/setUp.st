running
setUp
	
	super setUp.
	self reference: FileSystem memory / 'LBGitTests'.
	self reference ensureDirectory.
	self workingCopy: SquotWorkingCopy newOnObjectMemory.
	self workingCopy 
		name: 'LBGitTestWorkingCopy';
		store: SquotImageStore new;
		repository: (SquitRepository new initializeInDirectory: self reference );
		loadedHistorian: (self workingCopy repository historianNamed: 'master').