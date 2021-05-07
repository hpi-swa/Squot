running
run
	promise := Promise new.
	Project current addDeferredUIMessage:
		[self withActiveUnitOfWork:
			[self initializeQuery;
				requestRemoteDetails]].
	^ promise "will be resolved with a SquitAddRemote or rejected with #cancelled"