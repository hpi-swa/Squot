converting
rematerializeWith: aMaterializer
	| objectGraph |
	aMaterializer
		sourceGraph: self;
		targetGraph: (objectGraph := self mutableCopy);
		rematerialize: self startShadow.
	^ objectGraph