changes-operations
serializeChanges: aCollection into: aFileSystem
	(TonelWriter on: (aFileSystem referenceTo: self path))
		packageName: self package name;
		writeSnapshot: (self
			applyChanges: aCollection
			to: (self loadSnapshotFrom: aFileSystem))