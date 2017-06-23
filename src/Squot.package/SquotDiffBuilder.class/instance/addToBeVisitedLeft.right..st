private
addToBeVisitedLeft: leftShadow right: rightShadow
	leftShadow hasSquotShadowName
		ifTrue: [shadowNames at: leftShadow undecorated put: leftShadow name].
	rightShadow hasSquotShadowName
		ifTrue: [shadowNames at: rightShadow undecorated put: rightShadow name].
	toBeVisited add: leftShadow -> rightShadow.