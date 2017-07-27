as yet unclassified
follow: aPairOfShadows
	| leftShadow rightShadow baseShadow |
	leftShadow := aPairOfShadows key.
	rightShadow := aPairOfShadows value.
	rightShadow class == Association ifTrue:
		[baseShadow := leftShadow.
		leftShadow := rightShadow key.
		rightShadow := rightShadow value].
	(visited includes: leftShadow undecorated) ifTrue: [^ self].
	visited add: leftShadow undecorated.
	diffedPair := aPairOfShadows.
	baseShadow
		ifNil: [self left: leftShadow right: rightShadow]
		ifNotNil: [self left: leftShadow right: rightShadow base: baseShadow].