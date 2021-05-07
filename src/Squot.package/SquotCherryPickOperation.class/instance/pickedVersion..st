accessing
pickedVersion: aVersion

	pickedVersion := aVersion.
	self withUnitOfWorkActive:
		[self workingCopy addGlobalObjectsToStore: aVersion].