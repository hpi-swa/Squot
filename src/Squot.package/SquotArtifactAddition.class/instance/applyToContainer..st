patching
applyToContainer: anObjectContainer
	right := right capture.
	^ self willBeLoaded
		ifTrue: [anObjectContainer add: right]
		ifFalse: [anObjectContainer addUnloaded: right]