diffing high-level
left: leftShadow right: rightShadow
	"Answer a diff that would transform leftShadow into rightShadow"
	diffedPair ifNil: ["top invocation"
		^ self newPatchFrom: leftShadow to: rightShadow].
	leftShadow hasSquotShadowName
		ifTrue: [shadowNames at: leftShadow undecorated put: leftShadow name].
	rightShadow hasSquotShadowName
		ifTrue: [shadowNames at: rightShadow undecorated put: rightShadow name].
	(shadowNames at: leftShadow undecorated ifAbsent: [1])
	= (shadowNames at: rightShadow undecorated ifAbsent: [2])
		ifFalse: [^ self replacing: leftShadow with: rightShadow].
	^ leftShadow squotDiffAgainst: rightShadow with: self