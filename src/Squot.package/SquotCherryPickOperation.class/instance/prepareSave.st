applying
prepareSave
	^ self saveOperation
		patch: loadedPatch;
		author: pickedVersion author;
		yourself