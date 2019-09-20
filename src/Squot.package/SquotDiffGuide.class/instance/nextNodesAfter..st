guiding
nextNodesAfter: aPairOfShadows
	"Answer a collection of nodes that are reachable from anObject."
	| leftShadow rightShadow |
	leftShadow := aPairOfShadows key.
	rightShadow := aPairOfShadows value.
	self visited: leftShadow undecorated.
	^ diffBuilder compare: leftShadow with: rightShadow