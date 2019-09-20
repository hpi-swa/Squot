cleanup
removeNewChangeSetsNamedLike: aString after: aBlock
	| existingSets newSets |
	existingSets := ChangeSet allChangeSets asSet.
	aBlock ensure:
		[newSets := ChangeSet allChangeSets asSet copyWithoutAll: existingSets.
		newSets select: [:each | each name beginsWith: aString]
			thenDo: [:each | ChangeSet removeChangeSet: each]].