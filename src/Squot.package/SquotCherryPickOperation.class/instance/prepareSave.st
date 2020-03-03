applying
prepareSave
	| patchBuilder |
	^ self withUnitOfWork:
	[patchBuilder := self workingCopy baseVersion newPatchBuilder.
	loadedPatch diffsDo: [:each | patchBuilder addDiff: each].
	self saveOperation
		patch: patchBuilder buildPatch;
		author: pickedVersion author;
		unitOfWork: self unitOfWork;
		yourself]