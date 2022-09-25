accessing
updateResult
	self flag: #todo. "maybe it is more consistent to copy what is the instance variable 'working', apply changes to the copy, then compute the effective diff again, but it could also be too costly"
	(containerConflicts select: [:each | each isResolved]) do:
		[:each |
		each resolution squotHasChanges ifTrue:
			[diffs addDiff:
				(each key = SquotObjectGraphRootReference new
					ifTrue: [SquotObjectReplacement left: each resolution leftTarget right: each resolution rightTarget]
					ifFalse: [each resolution])
				forObjectNamed: (self keyOf: each resolution object)]].
	containerModifications do: 
		[:each |
		each squotHasChanges ifTrue:
			[diffs addDiff:
				(each isModification
					ifTrue:
						[each reference = SquotObjectGraphRootReference new
							ifTrue: [SquotObjectReplacement left: each leftTarget right: each rightTarget]
							ifFalse: [self isThisEverCalled]]
					ifFalse: [each])
				forObjectNamed: (self keyOf: each object)]].
	elementMerges do:
		[:each | | diff |
		each updateResult.
		diff := each working squotDiffAgainst: each result.
		diff squotHasChanges ifTrue:
			[diffs addDiff: diff forObjectNamed: (self keyOf: each object)]].
	diffs startObjectName: working startName.
	result := diffs squotApplyTo: working