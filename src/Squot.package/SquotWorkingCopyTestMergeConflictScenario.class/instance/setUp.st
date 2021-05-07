setUp
setUp
	repository withUnitOfWork:
		[self createBaseVersion;
			createFirstMergeParent;
			createSecondMergeParent].