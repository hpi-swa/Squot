accessing
startShadow: aShadow
	startShadow := aShadow.
	(self nameOf: aShadow undecorated ifAbsent: [])
		ifNotNil: [:name | startName := name].