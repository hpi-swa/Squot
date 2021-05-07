loading and unloading
discardUnsavedChanges
	repository withUnitOfWork:
		[self loadVersion: self baseVersion interactive: false].