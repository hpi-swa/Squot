Squot-diff-manipulation
squotAdjustToResemble: aSquotDiffNode updating: anObjectGraphDiff
	| adjusted |
	adjusted := self squotAdjustToResemble: aSquotDiffNode.
	anObjectGraphDiff changeDiff: self to: adjusted.
	^ adjusted