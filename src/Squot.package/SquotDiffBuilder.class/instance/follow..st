private
follow: aPairOfShadows
	| leftShadow rightShadow |
	leftShadow := aPairOfShadows key.
	rightShadow := aPairOfShadows value.
	leftShadow
		ifNil:
			["added object"
			(visited includes: rightShadow undecorated) ifTrue: [^ self].
			visited add: rightShadow undecorated.
			self followAddedObjectReferences: rightShadow]
		ifNotNil:
			["existing object"
			(visited includes: leftShadow undecorated) ifTrue: [^ self].
			visited add: leftShadow undecorated.
			diffedPair := aPairOfShadows.
			self left: leftShadow right: rightShadow].