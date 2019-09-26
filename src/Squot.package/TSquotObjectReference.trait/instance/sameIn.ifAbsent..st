accessing
sameIn: anObject ifAbsent: aBlock
	"Answer the same reference in another object, or evaluate the block if the other object
	does not contain an equivalent reference."
	^ self subclassResponsibility