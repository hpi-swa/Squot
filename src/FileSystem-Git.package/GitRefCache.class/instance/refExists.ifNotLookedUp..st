accessing
refExists: aString ifNotLookedUp: aBlock
	^ (refs associationAt: aString ifAbsent:
		[aBlock value
			ifTrue: [^ true]
			ifFalse: "remember"
				[| null |
				null := refs add: (GitReference zeroRefWithName: aString).
				self changedRef: null.
				null]]) exists