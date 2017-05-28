loading and unloading
loadSnapshotInteractively: aSnapshot
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| effectiveSnapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	self addGlobalObjectsToStore: aSnapshot.
	effectiveSnapshot :=
		(self composeSnapshotInteractivelyFrom: self currentSnapshot
			to: aSnapshot
			title: 'Selected changes to load'
			ifCanceled: [^ false]).
	store restoreToSnapshot: effectiveSnapshot.
	^ true