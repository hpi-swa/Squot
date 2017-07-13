adding
addShadow: aShadow of: anObject
	shadows at: (self nameOf: anObject ifAbsent: [^ aShadow]) put: aShadow.
	^ aShadow