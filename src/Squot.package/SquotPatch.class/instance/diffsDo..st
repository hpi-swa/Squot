enumerating
diffsDo: aBlock
	diffs select: [:each | each isRemoval] thenDo: aBlock.
	((patched loadOrder
		select: [:each | diffs includesKey: each])
		collect: [:each | diffs at: each])
		do: aBlock.