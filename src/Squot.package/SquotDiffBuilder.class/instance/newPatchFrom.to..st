diffing high-level
newPatchFrom: leftShadow to: rightShadow
	| fallbackName |
	resultPatch := SquotObjectGraphDiff new.
	self initialize.
	fallbackName := SquotObjectCapturer new rootName.
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	self followReferences.
	resultPatch startObjectName: (shadowNames at: leftShadow undecorated).
	^ resultPatch