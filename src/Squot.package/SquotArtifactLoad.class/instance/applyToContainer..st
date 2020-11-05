patching
applyToContainer: anObjectContainer
	willBeLoaded ifFalse: ["Do nothing" ^ self].
	(anObjectContainer = left workingCopy)
		ifTrue: [left load].
	"No further effect on the object container."