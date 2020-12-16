reflection
reflect: anObject in: aMirror
	"Answer the value of this reference in anObject."
	^ aMirror reflectInstanceVariable: self in: anObject