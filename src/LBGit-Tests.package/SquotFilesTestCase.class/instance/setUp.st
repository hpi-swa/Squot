running
setUp
	
	super setUp.
	self reference: FileSystem memory / self class name.
	self reference ensureDirectory.
	self workingCopy: (self makeWorkingCopyAt: self reference).