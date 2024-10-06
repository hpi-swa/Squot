operations
serializeInto: aFileSystem
	self mapper
		serialize: (self changedSnapshotForSerializeInto: aFileSystem)
		into: aFileSystem.