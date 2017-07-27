private
addToBeVisitedLeft: leftShadow right: rightShadow base: baseShadow
	self rememberNameOf: leftShadow;
		rememberNameOf: rightShadow;
		rememberNameOf: baseShadow.
	toBeVisited add: baseShadow -> (leftShadow -> rightShadow).