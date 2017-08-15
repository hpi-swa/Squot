diffing high-level
left: leftShadow right: rightShadow
	"Answer a diff that would transform leftShadow into rightShadow"
	diffedPair ifNil: ["top invocation"
		^ self startFromLeft: leftShadow right: rightShadow].
	self rememberNameOf: leftShadow;
		rememberNameOf: rightShadow.
	(shadowNames at: leftShadow undecorated ifAbsent: [1])
	= (shadowNames at: rightShadow undecorated ifAbsent: [2])
		ifFalse: [^ self replacing: leftShadow with: rightShadow].
	^ leftShadow squotDiffAgainst: rightShadow with: self