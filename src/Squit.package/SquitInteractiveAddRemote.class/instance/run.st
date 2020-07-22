running
run
	promise := Promise new.
	Project current addDeferredUIMessage:
		[query := SquitAddRemote new.
		self requestRemoteDetails].
	^ promise "will be resolved with a SquitAddRemote or rejected with #cancelled"