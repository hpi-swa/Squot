patching
applyToContainer: anObjectContainer
	willBeLoaded ifFalse: ["Do nothing" ^ self].
	anObjectContainer = left workingCopy
		ifTrue: [left load].
		"Otherwise, this is also applied to load order merges, where it has no effect."
	"No further effect on the object container."