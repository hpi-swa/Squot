reflection
reflect: anObject in: aMirror put: newValue
	^ aMirror reflectElement: self of: anObject put: newValue