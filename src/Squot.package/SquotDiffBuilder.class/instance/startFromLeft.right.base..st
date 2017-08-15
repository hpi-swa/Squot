diffing high-level
startFromLeft: leftShadow right: rightShadow base: baseShadow
	| fallbackName |
	graphDiff := SquotObjectGraphDiff new.
	self initialize.
	fallbackName := ({rightShadow. leftShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self rememberNameOf: baseShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow base: baseShadow.
	self followReferences.
	graphDiff startObjectName: (shadowNames at: leftShadow undecorated).
	^ graphDiff