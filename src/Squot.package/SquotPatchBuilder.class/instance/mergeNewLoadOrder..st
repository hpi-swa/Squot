private
mergeNewLoadOrder: aCollection
	| merge |
	merge := SquotLoadOrderMerge into: originalLoadOrder merge: aCollection basedOn: originalLoadOrder.
	diffs do: [:each | merge applyDiff: each].
	merge
		detectConflicts;
		chooseIncoming.
	^ merge.