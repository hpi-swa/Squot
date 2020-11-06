patching
applyToContainer: anObjectContainer
	willBeLoaded ifFalse: ["Do nothing" ^ self].
	(anObjectContainer artifactAt: left path) = left
		ifTrue: [left load]
		ifFalse: [self isThisEverCalled].
	"No further effect on the object container."