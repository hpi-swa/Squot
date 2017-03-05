loading and unloading
loadVersion: aVersion interactive: shouldBeInteractiveBoolean
	"Let my store restore the snapshot of aVersion and update my historian to aVersion.
	If there are unsaved changes in me and shouldBeInteractiveBoolean is true,
	let the user confirm the operation."
	shouldBeInteractiveBoolean ifTrue: [^ self loadVersionInteractively: aVersion].
	self store restoreToSnapshot: aVersion snapshot.
	self loadedHistorian version: aVersion.