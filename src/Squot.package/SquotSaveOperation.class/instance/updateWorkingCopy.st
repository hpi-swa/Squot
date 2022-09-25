applying
updateWorkingCopy
	| previousVersionOrNil |
	self withUnitOfWorkActive:
		[previousVersionOrNil := self workingCopy loadedVersion.
		self updateMetadataAfterSaving.
		self workingCopy
			loadedVersion: newVersion;
			cacheSavedArtifacts: patch in: newVersion;
			updateLoadOrderFromVersion: newVersion;
			resetAdditionalParents;
			resetNewVersionMessage].
	SquotToggles useNewApi ifFalse: [self workingCopy assertConsistentLoadOrder].