diffing high-level
newPatchFrom: leftShadow to: rightShadow base: baseShadow
	| fallbackName |
	resultPatch := SquotObjectGraphDiff new.
	self initialize.
	fallbackName := ({rightShadow. leftShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self rememberNameOf: baseShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow base: baseShadow.
	self followReferences.
	resultPatch startObjectName: (shadowNames at: leftShadow undecorated).
	^ resultPatch