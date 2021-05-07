tests
installMockRefStore: aUnitOfWork
	| refStore |
	aUnitOfWork refStores:
		{refStore := GitRefStoreMock new
			at: 'HEAD' put: 'ref: refs/heads/master';
			yourself}.
	^ refStore