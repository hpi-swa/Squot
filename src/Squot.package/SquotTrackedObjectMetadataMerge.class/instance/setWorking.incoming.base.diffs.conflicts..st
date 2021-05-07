initialize-release
setWorking: workingMetadata incoming: incomingMetadata base: baseMetadata diffs: diffsDictionary conflicts: conflictsDictionary
	super setWorking: workingMetadata incoming: incomingMetadata base: baseMetadata.
	containerModifications := diffsDictionary.
	containerConflicts := conflictsDictionary.