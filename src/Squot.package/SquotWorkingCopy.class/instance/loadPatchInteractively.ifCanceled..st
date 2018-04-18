loading and unloading
loadPatchInteractively: aPatch ifCanceled: cancelBlock
	"Let the user choose elements of the diff to load."
	| effectivePatch |
	self addGlobalObjectsToStore: aPatch.
	effectivePatch :=
		(self selectFromPatch: aPatch
			title: 'Selected changes to load'
			ifCanceled: cancelBlock).
	store applyPatch: effectivePatch.
	^ effectivePatch