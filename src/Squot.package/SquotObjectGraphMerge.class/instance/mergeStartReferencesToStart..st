private
mergeStartReferencesToStart: aGraphWalk
	((working hasSameStartObjectAs: incoming) and: [working hasSameStartObjectAs: base])
		ifFalse: [self notYetImplemented].
	aGraphWalk addFirst:
		{working startShadow.
		incoming startShadow.
		base startShadow}.