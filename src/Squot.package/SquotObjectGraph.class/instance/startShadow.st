accessing
startShadow
	^ startShadow ifNil: [self shadowNamed: startName]