SquotPatch
loadOrderMerge
	^ loadOrderMerge ifNil:
		[self computeLoadOrderDiff.
		diffs do: [:each | loadOrderMerge applyDiff: each].
		loadOrderMerge privateResolvedPatch. self flag: #encapsulation.
		loadOrderMerge chooseIncoming.
		loadOrderMerge]