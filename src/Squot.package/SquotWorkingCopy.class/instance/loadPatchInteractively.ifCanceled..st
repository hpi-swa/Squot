loading and unloading
loadPatchInteractively: aPatch ifCanceled: cancelBlock
	"Let the user choose elements of the diff to load."
	| effectivePatch |
	effectivePatch :=
		(self selectFromPatch: aPatch
			title: 'Selected changes to load'
			ifCanceled: [^ cancelBlock value]).
	store applyPatch: effectivePatch.
	^ effectivePatch