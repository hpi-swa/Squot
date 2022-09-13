patching
applyToContainer: anObjectContainer
	^ anObjectContainer applyDiff: self toObjectAt: self path