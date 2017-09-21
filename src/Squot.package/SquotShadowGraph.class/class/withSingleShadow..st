instance creation
withSingleShadow: aShadow
	^ SquotMutableObjectGraph new
		delegateRegistry: SquotActiveObjectRegistry value;
		ifNecessaryAssignNameToShadow: aShadow;
		startShadow: aShadow;
		as: self