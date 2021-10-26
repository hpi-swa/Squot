patching
squotValueShadowFrom: anObject reflectedIn: aMirror
	"Answer the new value for the reference.
	If I do not have a new value, but only an old value for the reference, answer that instead."
	self subclassResponsibility.