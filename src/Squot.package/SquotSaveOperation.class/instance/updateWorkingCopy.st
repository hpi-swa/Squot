applying
updateWorkingCopy
	| previousVersionOrNil |
	self withUnitOfWorkActive:
		[previousVersionOrNil := self workingCopy loadedVersion.
		self workingCopy
			updateMetadataAfterSaving: newVersion fromSnapshot: patch patched;
			loadedVersion: newVersion;
			cacheSavedArtifacts: patch in: newVersion;
			updateLoadOrderFromVersion: newVersion;
			resetAdditionalParents;
			resetNewVersionMessage].
	self workingCopy assertConsistentLoadOrder.