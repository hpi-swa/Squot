Pur version
snapshot
	"returns a snapshot"
	| fs |
	fs := repository workingTreeForCommitNamed: commit hexHash.
	^ (SquotFileSystemStore inDirectory: fs root)
		captureSnapshot