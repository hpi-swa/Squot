accessing
resetAt: path
	| diff |
	diff := diffs removeKey: path ifAbsent: [^ self].
	(diff isAddition or: [diff isRemoval])
		ifTrue:
			[loadOrderDiff := nil.
			loadOrderMerge := nil].