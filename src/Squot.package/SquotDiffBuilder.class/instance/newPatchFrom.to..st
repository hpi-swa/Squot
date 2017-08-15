diffing high-level
newPatchFrom: leftShadow to: rightShadow
	| fallbackName |
	graphDiff := SquotObjectGraphDiff new.
	self initialize.
	fallbackName := ({rightShadow. leftShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	self followReferences.
	graphDiff startObjectName: (shadowNames at: leftShadow undecorated).
	^ graphDiff