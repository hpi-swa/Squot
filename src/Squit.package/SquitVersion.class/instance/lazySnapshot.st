snapshot
lazySnapshot
	"Answer a snapshot that does not read artifacts until their content is requested"
	| fs |
	fs := repository workingTreeForCommitNamed: commit hexHash.
	^ (SquotFileSystemStore inDirectory: fs root)
		caputureLazySnapshot