Pur version
snapshot
	^ SquotToggles useNewApi
		ifTrue:
			[| fs store |
			fs := repository workingTreeForCommitNamed: commit hexHash.
			store := SquotFileSystemStore inDirectory: fs root.
			SquotProjectSnapshot fromStore: store]
		ifFalse: [self lazySnapshot]