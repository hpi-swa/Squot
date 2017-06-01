loading and unloading
loadVersion: aVersion interactive: shouldBeInteractiveBoolean
	"Let my store restore the snapshot of aVersion and update my historian to aVersion.
	If there are unsaved changes in me and shouldBeInteractiveBoolean is true,
	let the user confirm the operation."
	| snapshot |
	shouldBeInteractiveBoolean ifTrue: [^ self loadVersionInteractively: aVersion ifCanceled: []].
	snapshot := aVersion snapshot.
	self store restoreToSnapshot: snapshot.
	self loadedHistorian version: aVersion.
	self loadedVersion: aVersion.
	self cacheSavedArtifacts: snapshot artifacts.