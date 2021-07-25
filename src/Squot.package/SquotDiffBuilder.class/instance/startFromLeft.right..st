diffing high-level
startFromLeft: leftShadow right: rightShadow
	| walk fallbackName |
	true ifTrue: [^ self newStartFromLeft: leftShadow right: rightShadow].
	self initialize.
	graphDiff left: left; right: right.
	walk := SquotGraphComparisonWalk startingFrom: leftShadow and: rightShadow.
	fallbackName := ({rightShadow. leftShadow} detect: #hasSquotShadowName ifNone: [])
		ifNotNil: [:shadow | shadow name]
		ifNil: [SquotObjectCapturer new rootName].
	self rememberNameOf: leftShadow orAssume: [fallbackName].
	self rememberNameOf: rightShadow orAssume: [fallbackName].
	self addToBeVisitedLeft: leftShadow right: rightShadow.
	[toBeVisited isEmpty] whileFalse:
		[self follow: toBeVisited removeFirst].
	diffedPair := nil.
	graphDiff startObjectName: (shadowNames at: leftShadow undecorated).
	^ graphDiff