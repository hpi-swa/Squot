snapshot
captureLazySnapshot
	| fs |
	fs := repository workingTreeForCommitNamed: commit hexHash.
	^ (SquotFileSystemStore inDirectory: fs root) captureLazySnapshot