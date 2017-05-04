patching
applyPatch: aPatch
	aPatch diffs do: [:each | self applyDiff: each].