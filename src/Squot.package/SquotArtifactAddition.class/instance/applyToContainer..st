patching
applyToContainer: anObjectContainer
	^ self willBeLoaded
		ifTrue: [anObjectContainer add: right]
		ifFalse: [anObjectContainer addUnloaded: right]