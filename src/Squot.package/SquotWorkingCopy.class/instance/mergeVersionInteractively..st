loading and unloading
mergeVersionInteractively: aVersion
	"Let the user choose artifact editions to load from aVersion and add the version as parent version."
	| mergeSnapshot |
	self flag: #optimize. "work with diffs, not whole snapshots"
	mergeSnapshot :=
		store captureSnapshot
			mergeWith: aVersion snapshot
			basedOn: (aVersion mergeBaseWith: self baseVersion) snapshot.
	(self loadSnapshotInteractively: mergeSnapshot)
		ifTrue: [self addParentVersion: aVersion].