*Squot-Tools
adornedDiffNodeTitle: aString
	"Add adornments based on the state of the diff to the basic title, aString, and answer it."
	^ self willBeLoaded
		ifTrue: [super adornedDiffNodeTitle: aString]
		ifFalse: ['do not load ', (super adornedDiffNodeTitle: aString)]