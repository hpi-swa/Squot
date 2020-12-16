reflection
reflect: aDictionary in: aMirror put: newValue
	"Replace the value of this reference in anObject."
	^ aMirror reflectEntry: self of: aDictionary put: newValue