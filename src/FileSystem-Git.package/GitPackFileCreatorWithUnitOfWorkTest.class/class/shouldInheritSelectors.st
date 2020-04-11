testing
shouldInheritSelectors
	^ self name = #GitPackFileCreatorWithUnitOfWorkTest
		or: [super shouldInheritSelectors]