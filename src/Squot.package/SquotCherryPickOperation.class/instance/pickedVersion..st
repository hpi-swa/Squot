accessing
pickedVersion: aVersion

	pickedVersion := aVersion.
	self withUnitOfWorkActive:
		[SquotToggles useNewApi
			ifTrue: [aVersion snapshot project artifacts do: [:each | self workingCopy addIfAlreadyLoaded: each]]
			ifFalse: [self workingCopy addGlobalObjectsToStore: aVersion]].