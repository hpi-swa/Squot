as yet unclassified
follow: aPairOfShadows
	| leftShadow rightShadow |
	leftShadow := aPairOfShadows key.
	rightShadow := aPairOfShadows value.
	leftShadow ifNil: [^ self followAddedObjectReferences: rightShadow].
	(visited includes: leftShadow undecorated) ifTrue: [^ self].
	visited add: leftShadow undecorated.
	diffedPair := aPairOfShadows.
	self left: leftShadow right: rightShadow.