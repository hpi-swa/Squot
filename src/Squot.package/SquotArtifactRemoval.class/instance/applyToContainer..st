patching
applyToContainer: anObjectContainer
	^ anObjectContainer removeAt: (SquotToggles useNewApi ifTrue: [left id] ifFalse: [self path])