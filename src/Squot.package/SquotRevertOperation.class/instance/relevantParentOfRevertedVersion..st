accessing
relevantParentOfRevertedVersion: aVersion

	relevantParentOfRevertedVersion := aVersion.
	aVersion ifNotNil:
		[self withUnitOfWork:
			[SquotToggles useNewApi
				ifTrue: [aVersion snapshot project artifacts do: [:each | self workingCopy addIfAlreadyLoaded: each]]
				ifFalse: [self workingCopy addGlobalObjectsToStore: aVersion]]].