patching
applyToContainer: anObjectContainer
	self hasChanges ifFalse: [^ nil].
	anObjectContainer
		artifactAt: self path
		ifAbsent: [anObjectContainer add: (self instVarNamed: choice) left].
	self flag: 'FIXME: when a removal is chosen, it would be reverted above and repeated below'.
	^ (self instVarNamed: choice) applyToContainer: anObjectContainer