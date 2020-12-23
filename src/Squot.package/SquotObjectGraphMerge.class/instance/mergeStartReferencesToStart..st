private
mergeStartReferencesToStart: aGraphWalk
	(working hasSameStartObjectAs: incoming)
		ifTrue:
			[(working hasSameStartObjectAs: base)
				ifFalse:
					[self flag: #notYetImplemented.
					"All differences behind the start objects should be conflicts."
					"The further merge algorithm will not work because it will not find the base object under the same name as the working object."
					^ containerConflicts at: working startName put: (SquotObjectAdditionConflict working: working startShadow incoming: incoming startShadow)]]
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