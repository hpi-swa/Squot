as yet unclassified
applyToContainer: anObjectContainer
	"right := right capture."
	anObjectContainer removeAt: left path.
	^ anObjectContainer add: right