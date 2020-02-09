applying
prepareSave
	| patchBuilder |
	patchBuilder := self workingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | patchBuilder addDiff: each].
	^ self saveOperation
		patch: patchBuilder buildPatch;
		author: pickedVersion author;
		yourself