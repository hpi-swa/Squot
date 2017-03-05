loading and unloading
loadVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion."
	self flag: #optimize. "work with diffs, not whole snapshots"
	(self composeSnapshotInteractivelyFrom: store captureSnapshot
		to: aVersion snapshot
		title: 'Selected changes to load')
		ifNotNil: [:effectiveSnapshot | self halt. store restoreToSnapshot: effectiveSnapshot].