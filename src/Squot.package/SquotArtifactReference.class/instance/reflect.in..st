reflection
reflect: aSquotProjectSnapshot in: aMirror
	"Answer the value of this reference in anObject."

	^ aSquotProjectSnapshot artifacts detect: [:each | each path = path]