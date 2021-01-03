patching
applyToContainer: anObjectContainer
	self hasChanges ifFalse: [^ anObjectContainer artifactAt: self path].
	^ anObjectContainer applyDiff: self toObjectAt: self path