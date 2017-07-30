instance creation
withSingleShadow: aShadow
	| dummy |
	^ self new
		delegateRegistry: SquotActiveObjectRegistry value;
		assign: SquotObjectCapturer new rootName to: (dummy := SquotPlaceholder new);
		addShadow: aShadow of: dummy;
		startShadow: aShadow;
		yourself