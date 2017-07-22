patching
applyToContainer: anObjectContainer
	self hasChanges ifFalse: [^ nil].
	^ anObjectContainer applyDiff: self toObjectAt: self path