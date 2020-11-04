patching
applyToContainer: anObjectContainer
	(anObjectContainer = left workingCopy)
		ifTrue: [left load].
	"No further effect on the object container."