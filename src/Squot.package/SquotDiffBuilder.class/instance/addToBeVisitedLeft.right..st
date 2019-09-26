private
addToBeVisitedLeft: leftShadow right: rightShadow
	(left nameOf: leftShadow undecorated ifAbsent: []) ifNotNil:
		[:name | shadowNames at: leftShadow undecorated put: name].
	(right nameOf: rightShadow undecorated ifAbsent: []) ifNotNil:
		[:name | shadowNames at: rightShadow undecorated put: name].
	toBeVisited add: leftShadow -> rightShadow.