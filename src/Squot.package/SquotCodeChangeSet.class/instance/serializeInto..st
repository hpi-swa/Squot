operations
serializeInto: aFileSystem
	self mapper
		serialize: (self patch squotApplyTo: (self mapper loadSnapshotFrom: aFileSystem))
		into: aFileSystem.