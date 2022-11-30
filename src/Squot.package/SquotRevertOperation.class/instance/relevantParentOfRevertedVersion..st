accessing
relevantParentOfRevertedVersion: aVersion

	relevantParentOfRevertedVersion := aVersion.
	aVersion ifNotNil:
		[self withUnitOfWork:
			[self workingCopy addGlobalObjectsToStore: aVersion]].