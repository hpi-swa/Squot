reflection
reflect: aDictionary in: aMirror
	"Answer the value of this reference in anObject."
	^ aMirror reflectEntry: self of: aDictionary