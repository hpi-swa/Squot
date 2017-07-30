instance creation
withSingleShadow: aShadow
	^ SquotMutableObjectGraph new
		delegateRegistry: SquotActiveObjectRegistry value;
		assign: (SquotActiveObjectRegistry value
				ifNotNil: [SquotActiveObjectRegistry nameOf: aShadow]
				ifNil: [SquotObjectCapturer new rootName])
		toShadow: aShadow;
		startShadow: aShadow;
		as: self