as yet unclassified
shouldInheritSelectors
	^ self name = #GitRepositoryConfigWithUnitOfWorkTest
		or: [super shouldInheritSelectors]