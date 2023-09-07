operations
serializeInto: aFileSystem
	(TonelWriter on: (aFileSystem referenceTo: self path))
		packageName: self package name;
		writeSnapshot: (self patch squotApplyTo: (self mapper loadSnapshotFrom: aFileSystem))