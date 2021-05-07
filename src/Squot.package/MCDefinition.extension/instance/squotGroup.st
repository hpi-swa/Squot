*Squot-Tools
squotGroup
	"Answer a string that will be the title of the parent node of a change to this definition in a diff tree."
	^ ('MC*Definition' match: self class name)
		ifTrue: [self class name copyFrom: 3 to: self class name size - 'Definition' size]
		ifFalse: [self subclassResponsibility]