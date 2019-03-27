SquotPatch
diffsDo: aBlock
	diffs select: [:each | each isRemoval] thenDo: aBlock.
	((patchedLoadOrder
		select: [:each | diffs includesKey: each])
		collect: [:each | diffs at: each])
		do: aBlock.