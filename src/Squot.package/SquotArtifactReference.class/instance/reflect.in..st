reflection
reflect: aSquotProjectSnapshot in: aMirror
	"Answer the value of this reference in anObject."

	^ aMirror artifacts detect: [:each | each path = path]