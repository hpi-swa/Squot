test fixture
prepareWorkingVersion
	workingCopy loadedHistorian version: baseVersion.
	workingCopy discardUnsavedChanges. "reset text to baseVersion"
	conflictObject replaceFrom: 1 to: conflictObject size with: 'Changed text'.