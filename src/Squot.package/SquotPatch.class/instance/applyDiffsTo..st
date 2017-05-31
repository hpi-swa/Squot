applying
applyDiffsTo: anObjectContainer
	diffs do: [:each | anObjectContainer applyDiff: each].