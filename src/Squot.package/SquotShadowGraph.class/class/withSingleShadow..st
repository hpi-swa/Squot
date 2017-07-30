instance creation
withSingleShadow: aShadow
	^ SquotMutableObjectGraph new
		delegateRegistry: SquotActiveObjectRegistry value;
		assign: (SquotActiveObjectRegistry value
				ifNotNil: [SquotActiveObjectRegistry nameOf: aShadow]
				ifNil: [self anonymousObjectName])
		toShadow: aShadow;
		startShadow: aShadow;
		as: self