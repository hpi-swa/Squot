snapshot
lazySnapshot
	"Answer a snapshot that does not read artifacts until their content is requested"
	^ repository
		cachedSnapshotOf: self
		ifAbsentPut: [| fs |
			fs := repository workingTreeForCommitNamed: commit hexHash.
			(SquotFileSystemStore inDirectory: fs root) 	captureLazySnapshot]