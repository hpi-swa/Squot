diffing high-level
newPatchFrom: leftShadow to: rightShadow
	resultPatch := SquotObjectGraphDiff new.
	visited := IdentitySet new.
	leftShadow hasSquotShadowName
		ifTrue: [shadowNames at: leftShadow undecorated put: leftShadow name]
		ifFalse: [| newName | newName := #().
			shadowNames at: leftShadow undecorated put: newName].
	resultPatch startObjectName: (shadowNames at: leftShadow).
	self transformingFrom: leftShadow to: rightShadow.
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	self followReferences.
	^ resultPatch