applying
updateWorkingCopy
	| previousVersionOrNil |
	self withUnitOfWorkActive:
		[previousVersionOrNil := self workingCopy loadedVersion.
		self workingCopy
			updateMetadataAfterSaving: newVersion fromSnapshot: patch patched;
			loadedVersion: newVersion;
			cacheSavedArtifacts: (self capturedArtifacts ifNil: [Dictionary new]);
			updateLoadOrderFromVersion: newVersion;
			resetAdditionalParents;
			resetNewVersionMessage].
	self workingCopy assertConsistentLoadOrder.