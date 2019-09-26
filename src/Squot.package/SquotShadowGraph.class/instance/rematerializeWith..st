converting
rematerializeWith: aMaterializer
	| objectGraph |
	aMaterializer
		sourceGraph: self;
		targetGraph: (objectGraph := SquotMutableObjectGraph new);
		rematerialize: self startShadow.
	objectGraph startName: self startName.
	^ objectGraph