loading and unloading
discardUnsavedChanges
	workingCopy repository withUnitOfWork:
		[self loadVersion: self baseVersion interactive: false].