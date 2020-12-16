reflection
reflect: anObject in: aMirror put: newValue
	"Replace the value of this reference in anObject."
	^ aMirror reflectInstanceVariable: self in: anObject put: newValue