loading and unloading
loadVersion: aVersion interactive: shouldBeInteractiveBoolean
	"Let my store restore the snapshot of aVersion and update my historian to aVersion.
	If there are unsaved changes in me and shouldBeInteractiveBoolean is true,
	let the user confirm the operation."
	| patch |
	shouldBeInteractiveBoolean ifTrue: [^ self loadVersionInteractively: aVersion ifCanceled: []].
	UIManager default informUser: 'Loading version ', aVersion asString during:
	[patch := aVersion patchRelativeToBase: self lazySnapshot.
	self addGlobalObjectsToStore: patch.
	UIManager default informUser: 'Loading objects' during:
	[store applyPatch: patch]].
	self loadedHistorian version: aVersion.
	self loadedVersion: aVersion.