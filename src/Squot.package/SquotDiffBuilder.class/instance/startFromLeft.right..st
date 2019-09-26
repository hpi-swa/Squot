diffing high-level
startFromLeft: leftShadow right: rightShadow
	| fallbackName |
	self initialize.
	graphDiff left: left; right: right.
	fallbackName := ({rightShadow. leftShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	self followReferences.
	graphDiff startObjectName: (shadowNames at: leftShadow undecorated).
	^ graphDiff