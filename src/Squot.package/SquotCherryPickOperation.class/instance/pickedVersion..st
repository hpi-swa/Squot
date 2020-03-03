accessing
pickedVersion: aVersion

	pickedVersion := aVersion.
	self withUnitOfWork:
		[self workingCopy addGlobalObjectsToStore: aVersion].