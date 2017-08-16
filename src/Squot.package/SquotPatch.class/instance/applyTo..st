applying
applyTo: anObjectContainer
	diffs do: [:each | anObjectContainer applyDiff: each].