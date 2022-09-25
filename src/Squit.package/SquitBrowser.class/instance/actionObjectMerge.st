actions on objects
actionObjectMerge
	self withUnitOfWork:
	[| mergeOperation |
	(mergeOperation := self projectSelection newInteractiveMergeOperation)
		workingVersion: self projectSelection loadedVersion;
		mergeVersion: self commitSelection;
		mergeScope: (SquotMergeOperationArtifactScope operation: mergeOperation artifact: self objectSelection artifact);
		doNotAddParent;
		prepare;
		applyToWorkingCopy].