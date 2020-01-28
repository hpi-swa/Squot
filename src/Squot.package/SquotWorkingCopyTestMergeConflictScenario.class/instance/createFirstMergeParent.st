setUp
createFirstMergeParent
	sampleClass compileSilently: 'conflictMethod ^ 1'
		classified: 'conflict methods'.
	secondMethodSource := (sampleClass >> #conflictMethod) getSource asString.
	workingCopy saveVersionWithMessage: 'second version'.
	secondVersion := workingCopy baseVersion.