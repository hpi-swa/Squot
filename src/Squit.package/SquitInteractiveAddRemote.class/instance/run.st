running
run
	promise := Promise new.
	Project current addDeferredUIMessage:
		[query := SquitAddRemote new.
		self requestRemoteDetails].
	^ promise