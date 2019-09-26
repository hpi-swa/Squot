converting
setUpTreeRoot: aMergeNode toEditMerge: aMerge
	aMergeNode
		includeBlock: [self chooseIncoming];
		excludeBlock: [self chooseWorking].
	self hasConflicts ifTrue:
		[aMergeNode resetBlock: [self resetChoice]].