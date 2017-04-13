loading and unloading
loadVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	self flag: #optimize. "work with diffs, not whole snapshots"
	(self composeSnapshotInteractivelyFrom: store captureSnapshot
		to: aVersion snapshot
		title: 'Selected changes to load')
		ifNil: [^ false]
		ifNotNil: [:effectiveSnapshot | self halt.
			store restoreToSnapshot: effectiveSnapshot.
			^ true].