actions on versions
actionCommitMergeIntoMemory
	self withUnitOfWork:
	[[self projectSelection newInteractiveMergeOperation
			workingVersion: self projectSelection loadedVersion;
			mergeVersion: self commitSelection;
			doNotAddParent;
			prepare;
			applyToWorkingCopy]
		on: SquotVersionAlreadyInHistory do:
			[:e | self inform: 'Your objects are descendants of this version already.']]