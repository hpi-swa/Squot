loading and unloading
loadVersionInteractively: aVersion ifCanceled: cancelBlock
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| patch |
	self addGlobalObjectsToStore: aVersion lazySnapshot.
	patch := aVersion patchRelativeToBase: store.
	self loadPatchInteractively: patch ifCanceled: cancelBlock.