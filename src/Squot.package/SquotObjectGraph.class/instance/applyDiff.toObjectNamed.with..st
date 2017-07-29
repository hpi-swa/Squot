patching
applyDiff: aDiff toObjectNamed: name with: aPatcher
	^ aPatcher
		apply: aDiff
		toLoaded: (self objectNamed: name ifAbsent: [self isThisEverCalled. aDiff squotAbsentPrototypeOfRight])