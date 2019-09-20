private
mergeStartReferencesToStart: aGraphWalk
	((working hasSameStartObjectAs: incoming) and: [working hasSameStartObjectAs: base])
		ifFalse: [self notYetImplemented].
	aGraphWalk nextPut:
		{working startShadow.
		incoming startShadow.
		base startShadow}.