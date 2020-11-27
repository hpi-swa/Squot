applying
updateWorkingCopy
	| previousVersionOrNil |
	self withUnitOfWorkActive:
		[previousVersionOrNil := self workingCopy loadedVersion.
		self workingCopy
			loadedVersion: newVersion;
			cacheSavedArtifacts: (self capturedArtifacts ifNil: [Dictionary new]);
			addAsUnloadedFrom: newVersion thatAreNotIn: previousVersionOrNil;
			updateLoadOrderFromVersion: newVersion;
			resetAdditionalParents;
			resetNewVersionMessage].
	self workingCopy assertConsistentLoadOrder.