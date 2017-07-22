diffing high-level
newPatchFrom: leftShadow to: rightShadow
	| fallbackName |
	resultPatch := SquotObjectGraphDiff new.
	visited := IdentitySet new.
	fallbackName := #().
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	self followReferences.
	resultPatch startObjectName: (shadowNames at: leftShadow undecorated).
	^ resultPatch