patching
applyContentDiffTo: aShadowGraph
	diffContent hasChanges ifFalse: [^ aShadowGraph].
	^ diffContent squotApplyTo: aShadowGraph