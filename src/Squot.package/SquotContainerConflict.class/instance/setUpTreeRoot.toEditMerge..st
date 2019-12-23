*Squot-Tools
setUpTreeRoot: aMergeNode toEditMerge: aMerge
	aMergeNode
		includeBlock: [self chooseIncoming];
		excludeBlock: [self chooseWorking];
		resetBlock: [self resetChoice].