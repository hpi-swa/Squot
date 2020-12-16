reflection
reflect: anObject in: aMirror
	"Answer the value of this reference in anObject."
	^ aMirror reflectIndexableField: self in: anObject