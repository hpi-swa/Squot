applying
applyDiffsTo: anObjectContainer displayingProgress: progressText
	diffs do: [:each | anObjectContainer applyDiff: each] displayingProgress: progressText.