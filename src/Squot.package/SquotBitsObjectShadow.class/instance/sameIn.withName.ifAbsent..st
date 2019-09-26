accessing
sameIn: aShadowGraph withName: aName ifAbsent: aBlock
	"Unlike objects of my superclass, I can have a name and an identity.
	Answer the object with the same name from the other graph."
	^ aShadowGraph shadowNamed: aName ifAbsent: aBlock