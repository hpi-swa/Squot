private
mergeStartReferencesToStart: aGraphWalk
	(working hasSameStartObjectAs: incoming)
		ifTrue:
			[(working hasSameStartObjectAs: base)
				ifFalse:
					[self flag: #notYetImplemented.
					"All differences behind the start objects should be conflicts."
					"Try to create an empty object of the same kind as base..."
					^ aGraphWalk addFirst:
						{working startShadow.
						incoming startShadow.
						working startShadow undecorated class new}]]
		ifFalse:
			[self flag: #notYetImplemented.
			(working hasSameStartObjectAs: base)
				ifTrue: [containerModifications at: working startName put: (SquotObjectReplacement left: working startObject right: incoming startObject)]
				ifFalse:
					[base startName isNil ifTrue:
						[containerConflicts
							at: working startName put: (SquotObjectAdditionConflict working: working startShadow incoming: incoming startShadow);
							at: incoming startName put: (containerConflicts at: working startName).
						^ self].
					SquotObjectReferenceConflict]].
	aGraphWalk addFirst:
		{working startShadow.
		incoming startShadow.
		base startShadow}.