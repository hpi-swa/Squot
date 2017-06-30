running
tearDown
	workingCopy unload.
	(repository respondsTo: #close) ifTrue: [repository close].
	(store respondsTo: #close) ifTrue: [store close].
	repository delete: workingCopy loadedHistorian.