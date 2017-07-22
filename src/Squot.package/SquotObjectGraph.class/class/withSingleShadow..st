instance creation
withSingleShadow: aShadow
	| dummy |
	^ self new
		delegateRegistry: SquotActiveObjectRegistry value;
		assign: #() to: (dummy := SquotPlaceholder new);
		addShadow: aShadow of: dummy;
		startShadow: aShadow;
		yourself