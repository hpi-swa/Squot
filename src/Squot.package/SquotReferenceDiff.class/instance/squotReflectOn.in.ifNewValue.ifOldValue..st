patching
squotReflectOn: anObject in: aMirror ifNewValue: newBlock ifOldValue: oldBlock
	"If I have a new value for the reference, evaluate newBlock with it.
	If I do not have a new value, but only an old value for the reference, evaluate oldBlock with it."
	self subclassResponsibility.