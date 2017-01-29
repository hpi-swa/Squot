running
tearDown
	classFactory cleanUp.
	workingCopy unload.
	(repository respondsTo: #close) ifTrue: [repository close].
	(store respondsTo: #close) ifTrue: [store close].
	classFactory := nil.
	workingCopy := nil.
	repository := nil.
	store := nil.