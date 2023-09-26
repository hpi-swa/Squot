operations
serializeInto: aFileSystem
	(self writerOn: aFileSystem)
		writeSnapshot: (self patch squotApplyTo: (self mapper loadSnapshotFrom: aFileSystem)).