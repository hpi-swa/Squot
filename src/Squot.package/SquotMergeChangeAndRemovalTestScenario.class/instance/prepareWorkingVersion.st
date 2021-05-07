test fixture
prepareWorkingVersion
	workingCopy loadedHistorian version: baseVersion.
	workingCopy discardUnsavedChanges. "reset text to baseVersion"
	conflictObject contents: 'Changed text'.