accessing
sameIn: anObject
	"Answer the same reference in another object."
	^ self sameIn: anObject ifAbsent: [(NotFound object: self) signal]