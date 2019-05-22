loading and unloading
loadPatch: aPatch
	| effectivePatch |
	effectivePatch := aPatch.
	aPatch hasConflicts ifTrue:
		[effectivePatch := SquotPatchHasConflicts new
			patch: effectivePatch;
			signal].
	store applyPatch: effectivePatch.