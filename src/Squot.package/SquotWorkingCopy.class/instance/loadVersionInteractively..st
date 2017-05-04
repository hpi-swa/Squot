loading and unloading
loadVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| snapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	snapshot := aVersion snapshot.
	^ self loadSnapshotInteractively: snapshot