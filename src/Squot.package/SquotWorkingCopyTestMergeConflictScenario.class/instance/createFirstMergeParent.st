running
createFirstMergeParent
	sampleClass compileSilently: 'conflictMethod ^ 1'
		classified: 'conflict methods'.
	secondMethodSource := (sampleClass >> #conflictMethod) getSource asString.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.