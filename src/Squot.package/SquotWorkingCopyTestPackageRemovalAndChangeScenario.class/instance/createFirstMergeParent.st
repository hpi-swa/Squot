setUp
createFirstMergeParent
	sampleClass removeSelectorSilently: #conflictMethod.
	workingCopy saveVersionWithMessage: 'second version'.
	secondVersion := workingCopy baseVersion.