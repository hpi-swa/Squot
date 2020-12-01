patching
applyToContainer: anObjectContainer
	self isAddition ifTrue:
		[self willBeLoaded
			ifTrue: [^ anObjectContainer add: right]
			ifFalse: [^ anObjectContainer addUnloaded: right]].
	self isRemoval ifTrue: [^ anObjectContainer removeAt: path].
	^ anObjectContainer applyDiff: self toObjectAt: path