reflection
reflect: anObject in: aMirror put: newValue
	"Do not actually alter anObject."
	target := newValue.