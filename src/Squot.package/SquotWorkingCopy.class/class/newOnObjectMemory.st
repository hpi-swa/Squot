instance creation
newOnObjectMemory
	"Answer a new working copy that tracks objects in the running object memory (image)."
	| workingCopy |
	workingCopy := self new.
	workingCopy store: SquotImageStore new.
	^ workingCopy